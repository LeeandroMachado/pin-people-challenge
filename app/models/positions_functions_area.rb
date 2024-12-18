class PositionsFunctionsArea < ApplicationRecord
  belongs_to :position, required: true
  belongs_to :function, required: true
  belongs_to :functional_area, required: true

  validates :position, uniqueness: { scope: [ :function, :functional_area ] }
end
