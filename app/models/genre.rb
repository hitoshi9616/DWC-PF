class Genre < ApplicationRecord

  has_many :posts, dependent: :destroy

  validates :genre, presence: true, length: { in: 1..15 }

end
