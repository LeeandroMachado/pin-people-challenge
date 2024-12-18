require "dry-validation"

module Datasets
  class ImportDatasetFileSchema < Dry::Validation::Contract
    params do
      required(:dataset).filled
    end

    rule(:dataset) do
      if value.content_type && !%w[text/csv].include?(value.content_type)
        key.failure("file_type must be an csv file")
      end
    end
  end
end
