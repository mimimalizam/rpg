class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.integer :level
      t.references :character, index: true

      t.timestamps
    end
  end
end
