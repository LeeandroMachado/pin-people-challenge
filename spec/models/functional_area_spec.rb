require "rails_helper"

RSpec.describe FunctionalArea, type: :model do
  describe "validations" do
    subject(:functional_area) { build(:functional_area) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when name is missing" do
      before { functional_area.name = nil }

      it "includes error message" do
        is_expected.to be_invalid
        expect(functional_area.errors[:name]).to include("can't be blank")
      end
    end

    context "when name is not unique" do
      before { create(:functional_area, name: functional_area.name) }

      it "includes error message" do
        is_expected.to be_invalid
        expect(functional_area.errors[:name]).to include("has already been taken")
      end
    end
  end
end
