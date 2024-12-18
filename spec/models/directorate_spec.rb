require "rails_helper"

RSpec.describe Directorate, type: :model do
  describe "validations" do
    subject(:directorate) { build(:directorate) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when name is missing" do
      before { directorate.name = nil }

      it "includes error message" do
        is_expected.to be_invalid
        expect(directorate.errors[:name]).to include("can't be blank")
      end
    end

    context "when name is not unique" do
      before { create(:directorate, name: directorate.name) }

      it "includes error message" do
        is_expected.to be_invalid
        expect(directorate.errors[:name]).to include("has already been taken")
      end
    end
  end
end
