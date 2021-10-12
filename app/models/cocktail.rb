class Cocktail < ApplicationRecord
  
  has_one_attached :image
  
  belongs_to :user
  has_many :materials, dependent: :destroy
  
end
