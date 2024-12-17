class CreateOrganizationStructures < ActiveRecord::Migration[7.2]
  def change
    create_table :organization_structures do |t|
      t.references :company, null: false, foreign_key: true
      t.references :directorate, null: false, foreign_key: true
      t.references :management, null: false, foreign_key: true
      t.references :coordination, null: false, foreign_key: true
      t.references :org_area, null: false, foreign_key: true

      t.timestamps
    end

    add_index :organization_structures,
              [ :company_id, :directorate_id, :management_id,
                :coordination_id, :org_area_id ],
              unique: true
  end
end
