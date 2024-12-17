class CreateOrgAreas < ActiveRecord::Migration[7.2]
  def change
    create_table :org_areas do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :org_areas, :name, unique: true
  end
end
