module PositionsFunctionsAreas
  class BuildPositionsFunctionsAreaService < ::BuildService
    private

    def build
      function = cache_and_find(:functions, row[:funcao], Function)
      functional_area = cache_and_find(:functional_areas, row[:area], FunctionalArea)
      position = cache_and_find(:positions, row[:cargo], Position)

      PositionsFunctionsArea.find_or_create_by(
        function: function,
        functional_area: functional_area,
        position: position
      )
    end
  end
end
