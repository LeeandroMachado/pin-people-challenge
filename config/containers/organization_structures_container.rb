class OrganizationStructuresContainer
  extend Dry::Container::Mixin

  register "organization_structures.build_organization_structure_service" do
    OrganizationStructures::BuildOrganizationStructureService.new
  end
end
