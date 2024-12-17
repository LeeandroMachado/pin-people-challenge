module Datasets
  class StoreDatasetService
    def call(dataset)
      store(dataset)
    end

    private

    def store(data)
      employee_records = []
      caches = {
        companies: {}, directorates: {}, management: {}, coordinations: {},
        org_areas: {}, functions: {}, functional_areas: {}, positions: {},
        cities: {}, employees: {}
      }

      data[:dataset].each do |row|
        organization_structure = find_or_create_organization_structure(caches, row)
        positions_functions_area = find_or_create_positions_functions_area(caches, row)
        city = find_or_cache(caches[:cities], row[:localidade].titleize, City)
        employee = find_or_build_employee(caches, row, positions_functions_area, organization_structure, city)
        employee.survey_responses << build_survey_response(employee, row)

        employee_records << employee
      end

      ActiveRecord::Base.transaction do
        Employee.import(
          employee_records,
          batch_size: 50,
          recursive: true,
          on_duplicate_key_update: {
            conflict_target: [ :email ]
          }
        )
      end
    end

    def build_survey_response(employee, row)
      SurveyResponse.new({
        employee_id: employee.id,
        response_date: row[:data_da_resposta],
        interest_in_position: row[:interesse_no_cargo],
        interest_in_position_comments: row[:comentarios_interesse_no_cargo],
        contribution: row[:contribuicao],
        contribution_comments: row[:comentarios_contribuicao],
        learning_and_development: row[:aprendizado_e_desenvolvimento],
        learning_and_development_comments: row[:comentarios_aprendizado_e_desenvolvimento],
        feedback: row[:feedback],
        feedback_comments: row[:comentarios_feedback],
        manager_interaction: row[:interacao_com_gestor],
        manager_interaction_comments: row[:comentarios_interacao_com_gestor],
        career_clarity: row[:clareza_sobre_possibilidades_de_carreira],
        career_clarity_comments: row[:comentarios_clareza_sobre_possibilidades_de_carreira],
        permanence_expectation: row[:expectativa_de_permanencia],
        permanence_expectation_comments: row[:comentarios_expectativa_de_permanencia],
        enps: row[:enps],
        enps_comments: row[:aberta_enps]
      })
    end

    def find_or_build_employee(caches, row, positions_functions_area, organization_structure, city)
      employee = caches[:employees] ||= Employee.find_by(email: row[:email])
      return employee if employee.present?

      build_employee(row, positions_functions_area, organization_structure, city)
    end

    def build_employee(row, positions_functions_area, organization_structure, city)
      Employee.new({
        name: row[:nome],
        email: row[:email],
        corporate_email: row[:email_corporativo],
        positions_functions_area_id: positions_functions_area.id,
        organization_structure_id: organization_structure.id,
        gender: row[:genero],
        generation: row[:geracao],
        city_id: city.id,
        tenure: row[:tempo_de_empresa]
      })
    end

    def find_or_create_organization_structure(caches, row)
      company = find_or_cache(caches[:companies], row[:n0_empresa], Company)
      directorate = find_or_cache(caches[:directorates], row[:n1_diretoria], Directorate)
      management = find_or_cache(caches[:management], row[:n2_gerencia], Management)
      coordination = find_or_cache(caches[:coordinations], row[:n3_coordenacao], Coordination)
      org_area = find_or_cache(caches[:org_areas], row[:n4_area], OrgArea)

      OrganizationStructure.find_or_create_by(
        company: company, directorate: directorate, management: management,
        coordination: coordination, org_area: org_area
      )
    end

    def find_or_create_positions_functions_area(caches, row)
      function = find_or_cache(caches[:functions], row[:funcao], Function)
      functional_area = find_or_cache(caches[:functional_areas], row[:area], FunctionalArea)
      position = find_or_cache(caches[:positions], row[:cargo], Position)

      PositionsFunctionsArea.find_or_create_by(
        function: function, functional_area: functional_area, position: position
      )
    end

    def find_or_cache(cache, key, model)
      cache[key] ||= model.find_or_create_by(name: key)
    end
  end
end
