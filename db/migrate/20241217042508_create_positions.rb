class CreatePositions < ActiveRecord::Migration[7.2]
  def change
    create_table :positions do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :positions, :name, unique: true
  end
end
