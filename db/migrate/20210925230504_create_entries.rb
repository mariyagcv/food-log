class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :meal
      t.integer :calories
      t.integer :protein
      t.integer :carbs

      t.timestamps
    end
  end
end
