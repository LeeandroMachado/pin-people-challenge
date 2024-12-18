require "rails_helper"

RSpec.describe "Datasets Requests", type: :request do
  describe "POST datasets" do
    subject { post "/datasets", params: params }

    let(:file) { fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "dataset.csv"), "text/csv") }
    let(:file_with_errors) { fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "dataset-malformed.csv"), "text/csv") }
    let(:invalid_file) { fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "invalid.txt"), "text/plain") }

    let(:params) { { dataset: file } }

    before { subject }

    context "when successful" do
      it "returns 200" do
        expect(response).to have_http_status(:ok)
      end

      it "insert all csv data into database" do
        expect(Employee.all.size).to eq(500)
        expect(SurveyResponse.all.size).to eq(500)
      end
    end

    context "with valid file but invalid values" do
      let(:params) { { dataset: file_with_errors } }

      it "returns 422" do
        expect(response.status).to eq(422)
      end

      it "returns error messages" do
        expect(response.body).to include("is in invalid format")
      end
    end

    context "with invalid file" do
      let(:params) { { dataset: invalid_file } }

      it "returns 422" do
        expect(response.status).to eq(422)
      end

      it "returns file_type error messages" do
        expect(response.body).to include("file_type must be an csv file")
      end
    end
  end
end
