class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      
      t.timestamps
    end
  end
end
