class Review < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  has_many :review_comments, dependent: :destroy

  validates :evaluation, presence: true
  validates :text, presence: true

end
