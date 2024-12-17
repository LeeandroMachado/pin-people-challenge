require "rails_helper"

RSpec.describe OrgArea, type: :model do
  describe "validations" do
    subject(:org_area) { build(:org_area) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when name is missing" do
      before { org_area.name = nil }

      it "includes error message" do
        is_expected.to be_invalid
        expect(org_area.errors[:name]).to include("can't be blank")
      end
    end

    context "when name is not unique" do
      before { create(:org_area) }

      it "includes error message" do
        is_expected.to be_invalid
        expect(org_area.errors[:name]).to include("has already been taken")
      end
    end
  end
end
