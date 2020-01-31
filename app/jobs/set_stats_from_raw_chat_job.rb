class SetStatsFromRawChatJob < ApplicationJob
  queue_as :default

  def perform(chat)
    SetStatsFromRawChatService.new(chat).call
    chat.update(stats_present: true)
  end
end
