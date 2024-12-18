class Employee < ApplicationRecord
  self.per_page = 10

  belongs_to :organization_structure, required: true
  belongs_to :city, required: true
  belongs_to :positions_functions_area, required: true
  has_one :position, through: :positions_functions_area
  has_one :function, through: :positions_functions_area
  has_one :functional_area, through: :positions_functions_area
  has_many :survey_responses

  enum :gender, { masculino: 0, outro: 1, feminino: 2 }
  enum :generation, { geracao_x: 0, geracao_y: 1, geracao_z: 2, baby_boomer: 3 }

  validates :gender, inclusion: { in: genders.keys }
  validates :generation, inclusion: { in: generations.keys }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :corporate_email, presence: true, uniqueness: true
  validates :tenure, presence: true
end
