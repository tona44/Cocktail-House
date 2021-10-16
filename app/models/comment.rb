class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :cocktail

  validates :comment, presence: true, length: { maximum: 140 }

end
