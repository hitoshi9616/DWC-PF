class ReviewComment < ApplicationRecord

  belongs_to :customer
  belongs_to :review

  validates :comment, presence: true, length: { in: 1..255 }

end
