class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :uuid, index: true

      t.timestamps
    end
  end
end
