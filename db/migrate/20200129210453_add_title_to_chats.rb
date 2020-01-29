class AddTitleToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :title, :string
  end
end
