class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :name
      t.integer :level
      t.text :avatar
      t.references :character, index: true

      t.timestamps
    end
  end
end
