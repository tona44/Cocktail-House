class Cocktail < ApplicationRecord
  
  has_one_attached :image
  
  belongs_to :user
  
  # form_with親モデル内で、fields_for子モデルを扱う(newアクション)
  has_many :materials, dependent: :destroy
   accepts_nested_attributes_for :materials
   
end
