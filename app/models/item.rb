class Item < ApplicationRecord

  has_many :review, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true, length: { in: 1..50 }
  validates :introduction, presence: true, length: { in: 1..255 }
  validates :price, presence: true, numericality: {only_integer: true}

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
