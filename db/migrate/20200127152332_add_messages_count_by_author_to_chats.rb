class AddMessagesCountByAuthorToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :messages_count_by_author, :text
    add_column :chats, :authors, :text
  end
end
