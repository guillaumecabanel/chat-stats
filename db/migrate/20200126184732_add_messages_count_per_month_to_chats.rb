class AddMessagesCountPerMonthToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :messages_count_per_month, :text
    add_column :chats, :monthes, :text
  end
end
