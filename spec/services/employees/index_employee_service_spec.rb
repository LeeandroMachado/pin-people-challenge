require "rails_helper"

RSpec.describe Employees::IndexEmployeeService, type: :service do
  let(:service) { described_class.new }

  let!(:employee_one) { create(:employee, { name: "employee 001" }) }
  let!(:employee_two) { create(:employee, { name: "employee 002" }) }

  describe "#call" do
    context "when all employees are being listed" do
      subject { service.call({}) }

      it "returns all employees" do
        is_expected.to eq([ employee_one, employee_two ])
      end
    end

    context "when using name filter" do
      subject { service.call({ name: name }) }

      let(:name) { "001" }

      it "returns only matching employees" do
        is_expected.to eq([ employee_one ])
      end
    end

    context "when filter does not match" do
      subject { service.call({ name: name }) }

      let(:name) { "003" }

      it "returns empty array" do
        is_expected.to be_empty
      end
    end
  end
end
