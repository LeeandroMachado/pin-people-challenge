class FunctionalArea < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
