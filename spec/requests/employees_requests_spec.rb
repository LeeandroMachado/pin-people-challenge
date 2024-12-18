require "rails_helper"

RSpec.describe "Employees Requests", type: :request do
  describe "GET employees" do
    subject { get "/employees", params: params, headers: headers }

    let(:params) { { name: name } }
    let(:name) { "001" }

    let!(:employee_one) { create(:employee, { name: "employee 001" }) }
    let!(:employee_two) { create(:employee, { name: "employee 002" }) }

    context "when all employees are being listed" do
      let(:params) { {} }

      before { subject }

      it "returns 200" do
        expect(response).to have_http_status(:ok)
      end

      it "returns all employees" do
        body = JSON.parse(response.body)
        expect(body["data"].length).to eq(2)
      end
    end

    context "when using name filter" do
      before { subject }

      it "returns 200" do
        expect(response).to have_http_status(:ok)
      end

      it "returns matching employees qty" do
        body = JSON.parse(response.body)
        expect(body["data"].length).to eq(1)
      end
    end
  end
end
