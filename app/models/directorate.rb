class Directorate < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
