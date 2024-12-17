require "rails_helper"

RSpec.describe PositionsFunctionsArea, type: :model do
  describe "validations" do
    subject(:positions_functions_area) do
      build(
        :positions_functions_area, position: position, function: function,
        functional_area: functional_area
      )
    end

    let(:position) { create(:position) }
    let(:function) { create(:function) }
    let(:functional_area) { create(:functional_area) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when relationships are not unique" do
      before do
        create(
          :positions_functions_area, position: position, function: function,
          functional_area: functional_area
        )
      end

      it "includes error message" do
        is_expected.to be_invalid
        expect(positions_functions_area.errors[:position]).to include("has already been taken")
      end
    end
  end
end
