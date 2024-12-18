require "rails_helper"

RSpec.describe OrganizationStructures::BuildOrganizationStructureService, type: :service do
  let(:service) { described_class.new }

  let(:caches) { {
    companies: {}, directorates: {}, management: {}, coordinations: {},
    org_areas: {}
  } }

  let(:row) do
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
  end

  describe "#call" do
    context "with valid parameters" do
      it "creates a valid new OrganizationStructure instance" do
        result = service.call(row, caches)

        expect(result.valid?).to be_truthy
        expect(result.class).to eq(OrganizationStructure)
      end
    end
  end
end
