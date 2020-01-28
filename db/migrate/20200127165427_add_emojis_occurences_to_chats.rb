class AddEmojisOccurencesToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :emojis_love_occurences, :text
    add_column :chats, :emojis_animals_occurences, :text
  end
end
