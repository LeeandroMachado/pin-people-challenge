require "rails_helper"

RSpec.describe Position, type: :model do
  describe "validations" do
    subject(:position) { build(:position) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when name is missing" do
      before { position.name = nil }

      it "includes error message" do
        is_expected.to be_invalid
        expect(position.errors[:name]).to include("can't be blank")
      end
    end

    context "when name is not unique" do
      before { create(:position) }

      it "includes error message" do
        is_expected.to be_invalid
        expect(position.errors[:name]).to include("has already been taken")
      end
    end
  end
end
