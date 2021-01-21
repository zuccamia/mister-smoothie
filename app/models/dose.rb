class Dose < ApplicationRecord
  validates :description, presence: true
  validates_uniqueness_of :ingredient, scope: :smoothie

  belongs_to :smoothie
  belongs_to :ingredient
end
