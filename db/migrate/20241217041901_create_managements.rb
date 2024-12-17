class CreateManagements < ActiveRecord::Migration[7.2]
  def change
    create_table :managements do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :managements, :name, unique: true
  end
end
