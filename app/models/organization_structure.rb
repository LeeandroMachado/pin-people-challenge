class OrganizationStructure < ApplicationRecord
  belongs_to :company, required: true
  belongs_to :directorate, required: true
  belongs_to :management, required: true
  belongs_to :coordination, required: true
  belongs_to :org_area, required: true

  validates :company, uniqueness: { scope: [ :directorate, :management, :coordination, :org_area ] }

  def company_name
    company.name
  end

  def directorate_name
    directorate.name
  end

  def management_name
    management.name
  end

  def coordination_name
    coordination.name
  end

  def org_area_name
    org_area.name
  end
end
