require "rails_helper"

RSpec.describe Coordination, type: :model do
  describe "validations" do
    subject(:coordination) { build(:coordination) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when name is missing" do
      before { coordination.name = nil }

      it "includes error message" do
        is_expected.to be_invalid
        expect(coordination.errors[:name]).to include("can't be blank")
      end
    end

    context "when name is not unique" do
      before { create(:coordination, name: coordination.name) }

      it "includes error message" do
        is_expected.to be_invalid
        expect(coordination.errors[:name]).to include("has already been taken")
      end
    end
  end
end
