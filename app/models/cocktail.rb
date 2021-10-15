class Cocktail < ApplicationRecord

  has_one_attached :image

  belongs_to :user

  # form_with親モデル内で、fields_for子モデルを扱う(newアクション)
  has_many :materials, dependent: :destroy
   accepts_nested_attributes_for :materials

  validates :name, presence: true
  validates :base, presence: true
  validates :taste, presence: true
  
  # validate :validate_image
  #   def validate_image
  #     unless image.attached?
  #       image.purge
  #     end
  #   end

end
