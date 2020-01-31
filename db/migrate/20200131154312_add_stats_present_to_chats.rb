class AddStatsPresentToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :stats_present, :boolean, default: false
  end
end
