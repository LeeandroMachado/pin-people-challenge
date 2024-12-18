class PositionsFunctionsAreasContainer
  extend Dry::Container::Mixin

  register "positions_functions_areas.build_positions_functions_area_service" do
    PositionsFunctionsAreas::BuildPositionsFunctionsAreaService.new
  end
end
