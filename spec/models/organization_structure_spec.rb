require "rails_helper"

RSpec.describe OrganizationStructure, type: :model do
  describe "validations" do
    subject(:organization_structure) do
      build(
        :organization_structure, company: company, directorate: directorate,
        management: management, coordination: coordination, org_area: org_area
      )
    end

    let(:company) { create(:company) }
    let(:directorate) { create(:directorate) }
    let(:management) { create(:management) }
    let(:coordination) { create(:coordination) }
    let(:org_area) { create(:org_area) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when relationships are not unique" do
      before do
        create(
          :organization_structure, company: company, directorate: directorate,
          management: management, coordination: coordination, org_area: org_area
        )
      end

      it "includes error message" do
        is_expected.to be_invalid
        expect(organization_structure.errors[:company]).to include("has already been taken")
      end
    end
  end
end
