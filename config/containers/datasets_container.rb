class DatasetsContainer
  extend Dry::Container::Mixin

  register "datasets.import_dataset_service" do
    Datasets::ImportDatasetService.new
  end

  register "datasets.import_dataset_schema" do
    Datasets::ImportDatasetSchema.new
  end

  register "datasets.import_dataset_file_schema" do
    Datasets::ImportDatasetFileSchema.new
  end
end
