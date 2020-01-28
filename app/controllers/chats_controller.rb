class ChatsController < ApplicationController
  def new
    @chat = Chat.new

    @last_chats = session[:last_chats].present? ? Chat.where(uuid: session[:last_chats]).reverse : []
  end

  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      ::SetStatsFromRawChatService.new(@chat).call

      session[:last_chats] ||= []
      session[:last_chats] << @chat.uuid

      redirect_to chat_path @chat.uuid
    else
      render :new
    end
  end

  def show
    @chat = Chat.find_by uuid: params[:id]
    set_authors
    @truncated_authors = JSON.parse(@chat.authors).map { |author| author.truncate(8, omission: '') }
    @truncated_authors = @truncated_authors.to_json
  end

  private

  def chat_params
    params.require(:chat).permit(:raw_chat)
  end

  def set_authors
    authors = JSON.parse(@chat.authors)
    last_author = authors.pop
    @authors = "#{authors.join(', ')} #{t 'and'} #{last_author}"
  end
end
