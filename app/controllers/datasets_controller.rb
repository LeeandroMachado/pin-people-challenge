class DatasetsController < ApplicationController
  def import
    import_dataset_service = Container.resolve("datasets.import_dataset_service")
    import_dataset_service.call(datasets_params)

    head :ok
  end

  private

  def datasets_params
    params.require(:dataset)
  end
end
