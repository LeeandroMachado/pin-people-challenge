module OrganizationStructures
  class BuildOrganizationStructureService < ::BuildService
    private

    def build
      company = cache_and_find(:companies, row[:n0_empresa], Company)
      directorate = cache_and_find(:directorates, row[:n1_diretoria], Directorate)
      management = cache_and_find(:management, row[:n2_gerencia], Management)
      coordination = cache_and_find(:coordinations, row[:n3_coordenacao], Coordination)
      org_area = cache_and_find(:org_areas, row[:n4_area], OrgArea)

      OrganizationStructure.find_or_create_by(
        company: company,
        directorate: directorate,
        management: management,
        coordination: coordination,
        org_area: org_area
      )
    end
  end
end
