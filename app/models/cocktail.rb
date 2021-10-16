class Cocktail < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :favorites, dependent: :destroy

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

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


end
