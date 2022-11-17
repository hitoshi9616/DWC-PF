class PostComment < ApplicationRecord

  belongs_to :customer
  belongs_to :post

  validates :comment, presence: :true, length: { in: 1..255 }

end
