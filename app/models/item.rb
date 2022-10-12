class Item < ApplicationRecord

  has_many :review, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

end
