class SetStatsFromRawChatService
  def initialize(chat)
    @chat = chat
  end

  def call
    set_messages
    set_messages_count_per_month
    set_messages_count_by_author
    set_emojis_occurences

    @chat.update(messages_count: @messages.count)

    @chat.raw_chat.purge_later
  end

  private

  def set_messages
    @messages = []
    
    @chat.raw_chat.open do |file|
      File.foreach(file) do |line|
        matches = line.match /\]?(\d{1,2}\/\d{1,2}\/\d{2,4})[^\d]+(\d{2}[:\d{2}]+)\]?[ -]+([^:]*): (.*)/
        next unless matches
      
        @messages << {
          date: parse_datetime(matches),
          author: matches[3],
          content: matches[4]
        }
      end
    end
  end

  def set_messages_count_per_month
    monthly_messages = @messages.group_by { |message| message[:date].strftime('%Y-%m') }

    messages_count_per_month = monthly_messages.keys.sort.map do |month|
      monthly_messages[month].size
    end

    monthes = monthly_messages.keys.sort.map do |month|
      Date.parse("#{month}-01").strftime('%m/%Y')
    end
    
    @chat.update(
      monthes: monthes.to_json,
      messages_count_per_month: messages_count_per_month.to_json
    )
  end

  def set_messages_count_by_author
    messages_by_authors = @messages.group_by { |message| message[:author] }

    messages_count_by_author = {}

    messages_by_authors.each do |author, message_count|
      messages_count_by_author[author] = messages_by_authors[author].size
    end

    ordered_messages_count_by_author = messages_count_by_author.sort_by(&:last).reverse

    authors = ordered_messages_count_by_author.map do |author, message_count|
      # Redact phone numbers
      if author.match?(/[\d[ ]+]{8,14}/)
        "🤖 #{ordered_messages_count_by_author.index([author, message_count]) + 1}"
      else
        author
      end
    end.to_json


    messages_count = ordered_messages_count_by_author.map { |author, message_count| message_count }.to_json

    @chat.update(
      authors: authors,
      messages_count_by_author: messages_count
    )
  end

  def set_emojis_occurences
    @chat.raw_chat.open do |file|
      @chat.emojis_love_occurences = ::EmojisCounterService.new(file, :love).call.to_json
      @chat.emojis_animals_occurences = ::EmojisCounterService.new(file, :animals).call.to_json
    end
  end

  def date_us?
    return @date_us unless @date_us.nil?

    @chat.raw_chat.open do |file|
      File.foreach(file) do |line|
        @date_us = line.match?(/\d{1,2}\/\d{1,2}\/\d{2,4},/)
        break
      end
    end

    @date_us
  end

  def parse_datetime(matches)
    return DateTime.parse("#{matches[1]} #{matches[2]}") unless date_us?

    date = matches[1].match /(\d{1,2})\/(\d{1,2})\/(\d{2,4})/

    DateTime.parse("#{date[3]}/#{date[1]}/#{date[2]} #{matches[2]}")
  end
end
