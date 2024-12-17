module Datasets
  class ImportDatasetService
    include Import["datasets.import_dataset_schema", "datasets.store_dataset_service"]

    def call(csv)
      data_hash = parse_csv_to_hash(csv)
      valid_data = validate_data(data_hash)
      store_data(valid_data)
    end

    private

    def parse_csv_to_hash(csv)
      CSV.read(
        csv.path,
        headers: true,
        col_sep: ";",
        converters: [ :numeric ],
        header_converters: proc { |header| format_header(header) }
      ).map(&:to_h)
    end

    def validate_data(data)
      import_dataset_schema.call(dataset: data).to_h
    end

    def store_data(data)
      store_dataset_service.call(data)
    end

    def format_header(header)
      header.parameterize.gsub("-", "_").to_sym
    end
  end
end
