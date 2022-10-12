class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :genre
  has_many :post_comments, dependent: :destroy

  validates :title, presence: :true
  validates :text, presence: :true

end
