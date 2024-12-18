class DatasetsController < ApplicationController
  before_action :validate_file, only: [ :import ]

  def import
    import_dataset_service = Container.resolve("datasets.import_dataset_service")
    import_dataset_service.call(datasets_params)

    head :ok
  end

  private

  def validate_file
    import_dataset_file_schema = Container.resolve("datasets.import_dataset_file_schema")
    results = import_dataset_file_schema.call(dataset: datasets_params)

    if results.errors.present?
      raise DryValidationError.new(results.errors.to_h)
    end
  end

  def datasets_params
    params.require(:dataset)
  end
end
