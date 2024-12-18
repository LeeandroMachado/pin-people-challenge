module Datasets
  class ImportDatasetService
    include Import["datasets.import_dataset_schema", "employees.build_employee_service"]

    def call(csv)
      parsed_data = parse_csv_to_hash(csv)
      validated_data = validate_data(parsed_data)

      import_data(validated_data[:dataset])
    end

    private

    def parse_csv_to_hash(csv)
      CSV.read(
        csv.path,
        headers: true,
        col_sep: ";",
        converters: [ :numeric ],
        header_converters: proc { |header|
          header.parameterize.gsub("-", "_").to_sym
        }
      ).map(&:to_h)
    end

    def validate_data(data)
      results = import_dataset_schema.call(dataset: data)

      if results.errors.present?
        raise DryValidationError.new(results.errors.to_h)
      end

      results.to_h
    end

    def import_data(data)
      caches = initialize_caches
      records = data.map { |row| build_employee_service.call(row, caches) }

      ActiveRecord::Base.transaction do
        Employee.import(
          records,
          batch_size: 50,
          recursive: true,
          on_duplicate_key_update: {
            conflict_target: [ :email ],
            columns: [
              :positions_functions_area_id, :organization_structure_id,
              :city_id, :tenure
            ]
          }
        )
      end
    end

    def initialize_caches
      {
        companies: {}, directorates: {}, management: {}, coordinations: {},
        org_areas: {}, functions: {}, functional_areas: {}, positions: {},
        cities: {}, employees: {}
      }
    end
  end
end
