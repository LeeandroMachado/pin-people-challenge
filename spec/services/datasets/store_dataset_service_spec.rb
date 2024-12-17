require "rails_helper"

RSpec.describe Datasets::StoreDatasetService, type: :service do
  let(:service) { described_class.new }

  let(:params) do
    {
      dataset: [
        {
          nome: "Demo 001",
          email: "demo001@pinpeople.com.br",
          email_corporativo: "demo001@pinpeople.com.br",
          area: "administrativo",
          cargo: "estagiário",
          funcao: "profissional",
          localidade: "brasília",
          tempo_de_empresa: "entre 1 e 2 anos",
          genero: "masculino",
          geracao: "geracao_z",
          n0_empresa: "empresa",
          n1_diretoria: "diretoria a",
          n2_gerencia: "gerência a1",
          n3_coordenacao: "coordenação a11",
          n4_area: "área a112",
          data_da_resposta: "2022-01-20",
          interesse_no_cargo: 7,
          comentarios_interesse_no_cargo: "-",
          contribuicao: 1,
          comentarios_contribuicao: "-",
          aprendizado_e_desenvolvimento: 1,
          comentarios_aprendizado_e_desenvolvimento: "-",
          feedback: 6,
          comentarios_feedback: "-",
          interacao_com_gestor: 6,
          comentarios_interacao_com_gestor: "-",
          clareza_sobre_possibilidades_de_carreira: 6,
          comentarios_clareza_sobre_possibilidades_de_carreira: "-",
          expectativa_de_permanencia: 2,
          comentarios_expectativa_de_permanencia: "-",
          enps: 5,
          aberta_enps: "A empresa tem um excelente ambiente de trabalho e equipe colaborativa."
        }
      ]
    }
  end

  describe "#call" do
    context "with valid parameters" do
      it "stores data into database" do
        result = service.call(params)

        expect(result.num_inserts).to eq(1)
      end
    end

    context "when employee already exists" do
      let!(:employee) { create(:employee, :with_survey_response, email: "demo001@pinpeople.com.br") }

      before { service.call(params) }

      it "assigns the new survey to existing employee" do
        expect(employee.survey_responses.size).to eq(2)
      end
    end
  end
end
