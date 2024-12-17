require "rails_helper"

RSpec.describe "Datasets Requests", type: :request do
  describe "POST datasets" do
    subject { post "/datasets", params: params }

    let(:file) { fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "dataset.csv"), "text/csv") }
    let(:params) { { dataset: file } }

    context "when successful" do
      before { subject }

      it "returns 200" do
        expect(response).to have_http_status(:ok)
      end

      it "insert all csv data into database" do
        expect(Employee.all.size).to eq(500)
        expect(SurveyResponse.all.size).to eq(500)
      end
    end
  end
end
