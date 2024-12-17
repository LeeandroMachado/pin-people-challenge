class CreateCoordinations < ActiveRecord::Migration[7.2]
  def change
    create_table :coordinations do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :coordinations, :name, unique: true
  end
end
