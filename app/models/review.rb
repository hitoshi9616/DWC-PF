class Review < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  has_many :review_comments, dependent: :destroy

  validates :evaluation, presence: true
  validates :title, presence: :true, length: { in: 1..20 }
  validates :text, presence: true, length: { in: 1..255 }

end
