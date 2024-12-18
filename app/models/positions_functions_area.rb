class PositionsFunctionsArea < ApplicationRecord
  belongs_to :position, required: true
  belongs_to :function, required: true
  belongs_to :functional_area, required: true

  validates :position, uniqueness: { scope: [ :function, :functional_area ] }

  def position_name
    position.name
  end

  def function_name
    function.name
  end

  def functional_area_name
    functional_area.name
  end
end
