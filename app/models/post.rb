class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :genre
  has_many :post_comments, dependent: :destroy

  validates :title, presence: :true, length: { in: 1..20 }
  validates :text, presence: :true, length: { in: 1..255 }

end
