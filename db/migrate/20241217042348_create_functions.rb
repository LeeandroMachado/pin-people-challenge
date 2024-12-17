class CreateFunctions < ActiveRecord::Migration[7.2]
  def change
    create_table :functions do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :functions, :name, unique: true
  end
end
