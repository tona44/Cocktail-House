class Material < ApplicationRecord

  belongs_to :cocktail

  validates :name, presence: true
  validates :quantity, presence: true

end
