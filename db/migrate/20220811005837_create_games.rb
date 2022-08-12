class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :genre_id,            null: false
      t.integer :device_id,           null: false
      t.string :name,                 null: false
      t.text :summary,                null: false
      t.integer :price,               null: false
      t.integer :cero,                null: false,default: 0
      

      t.timestamps
    end
  end
end
