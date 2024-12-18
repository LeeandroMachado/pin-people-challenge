class OrganizationStructure < ApplicationRecord
  belongs_to :company, required: true
  belongs_to :directorate, required: true
  belongs_to :management, required: true
  belongs_to :coordination, required: true
  belongs_to :org_area, required: true

  validates :company, uniqueness: { scope: [ :directorate, :management, :coordination, :org_area ] }
end
