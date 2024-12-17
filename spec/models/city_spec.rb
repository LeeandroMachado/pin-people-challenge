require "rails_helper"

RSpec.describe City, type: :model do
  describe "validations" do
    subject(:city) { build(:city) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when name is missing" do
      before { city.name = nil }

      it "includes error message" do
        is_expected.to be_invalid
        expect(city.errors[:name]).to include("can't be blank")
      end
    end

    context "when name is not unique" do
      before { create(:city) }

      it "includes error message" do
        is_expected.to be_invalid
        expect(city.errors[:name]).to include("has already been taken")
      end
    end
  end
end
