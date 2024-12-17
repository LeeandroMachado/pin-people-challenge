class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :email
      t.string :corporate_email
      t.references :positions_functions_area, null: false, foreign_key: true
      t.references :organization_structure, null: false, foreign_key: true
      t.integer :gender
      t.integer :generation
      t.references :city, null: false, foreign_key: true
      t.string :tenure

      t.timestamps
    end

    add_index :employees, :email, unique: true
    add_index :employees, :corporate_email, unique: true
  end
end
