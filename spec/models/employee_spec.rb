require "rails_helper"

RSpec.describe Employee, type: :model do
  describe "validations" do
    subject(:employee) { build(:employee, email: "test@pinpeople.com") }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when email already exists" do
      before { create(:employee, email: "test@pinpeople.com") }

      it "is not valid" do
        is_expected.to be_invalid
        expect(employee.errors[:email]).to include("has already been taken")
      end
    end

    context "when gender is not correct" do
      it "is not valid" do
        expect { employee.gender = "male" }
          .to raise_error(ArgumentError)
          .with_message("'male' is not a valid gender")
      end
    end

    context "when generation is not correct" do
      it "is not valid" do
        expect { employee.generation = "gen_z" }
          .to raise_error(ArgumentError)
          .with_message("'gen_z' is not a valid generation")
      end
    end
  end
end
