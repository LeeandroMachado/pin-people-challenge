class CreateFunctionalAreas < ActiveRecord::Migration[7.2]
  def change
    create_table :functional_areas do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :functional_areas, :name, unique: true
  end
end
