class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.boolean :combat, default: false
      t.boolean :social, default: false
      t.boolean :search, default: false
      t.integer :quest_id
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
