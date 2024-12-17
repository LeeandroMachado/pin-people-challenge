class CreatePositionsFunctionsAreas < ActiveRecord::Migration[7.2]
  def change
    create_table :positions_functions_areas do |t|
      t.references :position, null: false, foreign_key: true
      t.references :function, null: false, foreign_key: true
      t.references :functional_area, null: false, foreign_key: true

      t.timestamps
    end

    add_index :positions_functions_areas,
            [ :position_id, :function_id, :functional_area_id ],
              unique: true
  end
end
