require "dry-validation"

module Types
  include Dry::Types()

  ConvertedDate = Types::String.constructor do |value|
    date = ::Date.strptime(value, "%d/%m/%Y")
    date.strftime("%Y-%m-%d")
  rescue
    nil
  end

  ParameterizedString = Types::String.constructor do |value|
    value.parameterize(separator: "_") if value.is_a?(::String)
  end
end

module Datasets
  class ImportDatasetSchema < Dry::Validation::Contract
    schema do
      required(:dataset).array(:hash) do
        required(:nome).filled(:string)
        required(:email).filled(:string, format?: /\A[^@\s]+@[^@\s]+\z/)
        required(:email_corporativo).filled(:string, format?: /\A[^@\s]+@[^@\s]+\z/)
        required(:area).filled(:string)
        required(:cargo).filled(:string)
        required(:funcao).filled(:string)
        required(:localidade).filled(:string)
        required(:tempo_de_empresa).filled(:string)
        required(:genero).filled(:string, included_in?: [ "masculino", "outro", "feminino" ])
        required(:geracao)
          .filled(:string)
          .value(Types::ParameterizedString)
          .value(included_in?: [ "geracao_z", "geracao_y", "geracao_x", "baby_boomer" ])
        required(:n0_empresa).filled(:string)
        required(:n1_diretoria).filled(:string)
        required(:n2_gerencia).filled(:string)
        required(:n3_coordenacao).filled(:string)
        required(:n4_area).filled(:string)
        required(:data_da_resposta).filled(:string).value(Types::ConvertedDate)
        required(:interesse_no_cargo).filled(:integer, included_in?: 0..10)
        required(:comentarios_interesse_no_cargo).filled(:string)
        required(:contribuicao).filled(:integer, included_in?: 0..10)
        required(:comentarios_contribuicao).filled(:string)
        required(:aprendizado_e_desenvolvimento).filled(:integer, included_in?: 0..10)
        required(:comentarios_aprendizado_e_desenvolvimento).filled(:string)
        required(:feedback).filled(:integer, included_in?: 0..10)
        required(:comentarios_feedback).filled(:string)
        required(:interacao_com_gestor).filled(:integer, included_in?: 0..10)
        required(:comentarios_interacao_com_gestor).filled(:string)
        required(:clareza_sobre_possibilidades_de_carreira).filled(:integer, included_in?: 0..10)
        required(:comentarios_clareza_sobre_possibilidades_de_carreira).filled(:string)
        required(:expectativa_de_permanencia).filled(:integer, included_in?: 0..10)
        required(:comentarios_expectativa_de_permanencia).filled(:string)
        required(:enps).filled(:integer, included_in?: 0..10)
        required(:aberta_enps).filled(:string)
      end
    end
  end
end
