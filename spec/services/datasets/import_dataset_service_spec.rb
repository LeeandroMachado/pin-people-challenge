require "rails_helper"

RSpec.describe Datasets::ImportDatasetService, type: :service do
  let(:service) { described_class.new }

  let(:file) { fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "dataset.csv"), "text/csv") }
  let(:file_with_errors) { fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "dataset-malformed.csv"), "text/csv") }

  describe "#call" do
    context "with valid parameters" do
      it "imports data correctly" do
        result = service.call(file)

        expect(result.ids.length).to eq(500)
        expect(Employee.all.length).to eq(500)
        expect(SurveyResponse.all.length).to eq(500)
      end
    end

    context "with invalid parameters" do
      it "raises DryValidationError" do
        expect {
          service.call(file_with_errors)
        }.to raise_error(DryValidationError)
      end
    end
  end
end
