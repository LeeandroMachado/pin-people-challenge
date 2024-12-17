require "rails_helper"
require "dry-validation"

RSpec.describe Datasets::ImportDatasetSchema do
  subject(:validator) do
    described_class.new.call(params)
  end

  let(:nome) { "Demo 001" }
  let(:email) { "demo001@pinpeople.com.br" }
  let(:genero) { "masculino" }
  let(:contribuicao) { 1 }
  let(:data_da_resposta) { "20/01/2022" }

  let(:params) do
    {
      dataset: [
        {
          nome: nome,
          email: email,
          email_corporativo: "demo001@pinpeople.com.br",
          area: "administrativo",
          cargo: "estagiário",
          funcao: "profissional",
          localidade: "brasília",
          tempo_de_empresa: "entre 1 e 2 anos",
          genero: genero,
          geracao: "geração z",
          n0_empresa: "empresa",
          n1_diretoria: "diretoria a",
          n2_gerencia: "gerência a1",
          n3_coordenacao: "coordenação a11",
          n4_area: "área a112",
          data_da_resposta: data_da_resposta,
          interesse_no_cargo: 7,
          comentarios_interesse_no_cargo: "-",
          contribuicao: contribuicao,
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

  describe "validations" do
    context "with valid parameters" do
      it "is valid" do
        expect(validator.success?).to be_truthy
      end

      it "changes data_da_resposta format" do
        data_da_resposta = validator.to_h[:dataset][0][:data_da_resposta]
        expect(data_da_resposta).to eq("2022-01-20")
      end
    end

    context "with wrong type" do
      let(:nome) { 123 }

      it "is invalid and includes empty carrier name error" do
        expect(validator.success?).to be_falsy
        expect(validator.errors.messages.to_s).to include("must be a string")
      end
    end

    context "with wrong format" do
      let(:email) { "demo001pinpeople.com.br" }

      it "is invalid and includes invalid format error" do
        expect(validator.success?).to be_falsy
        expect(validator.errors.messages.to_s).to include("is in invalid format")
      end
    end

    context "with invalid option" do
      let(:genero) { "masculinos" }

      it "is invalid and includes invalid option error" do
        expect(validator.success?).to be_falsy
        expect(validator.errors.messages.to_s).to include("must be one of")
      end
    end

    context "with invalid value range" do
      let(:contribuicao) { 20 }

      it "is invalid and includes invalid option error" do
        expect(validator.success?).to be_falsy
        expect(validator.errors.messages.to_s).to include("must be one of: 0 - 10")
      end
    end

    context "with invalid data_da_resposta" do
      let(:data_da_resposta) { "12313" }

      it "is invalid and includes invalid option error" do
        expect(validator.success?).to be_falsy
        expect(validator.errors.messages.to_s).to include("must be a string")
      end
    end
  end
end
