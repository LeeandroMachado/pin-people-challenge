module SurveyResponses
  class BuildSurveyResponseService < ::BuildService
    def call(row, caches, employee)
      @employee = employee

      super(row, caches)
    end

    private

    attr_reader :employee

    def build
      SurveyResponse.new(
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
      )
    end
  end
end
