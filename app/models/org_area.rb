class OrgArea < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
