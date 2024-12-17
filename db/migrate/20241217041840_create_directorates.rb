class CreateDirectorates < ActiveRecord::Migration[7.2]
  def change
    create_table :directorates do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :directorates, :name, unique: true
  end
end
