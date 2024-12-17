require "rails_helper"

RSpec.describe Function, type: :model do
  describe "validations" do
    subject(:function) { build(:function) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when name is missing" do
      before { function.name = nil }

      it "includes error message" do
        is_expected.to be_invalid
        expect(function.errors[:name]).to include("can't be blank")
      end
    end

    context "when name is not unique" do
      before { create(:function) }

      it "includes error message" do
        is_expected.to be_invalid
        expect(function.errors[:name]).to include("has already been taken")
      end
    end
  end
end
