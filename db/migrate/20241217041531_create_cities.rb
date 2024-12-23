class CreateCities < ActiveRecord::Migration[7.2]
  def change
    create_table :cities do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :cities, :name, unique: true
  end
end
