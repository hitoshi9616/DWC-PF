class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :last_name, presence: true, length: { in: 1..50 }
  validates :first_name, presence: true, length: { in: 1..50 }
  validates :last_name_kana, presence: true, length: { in: 1..50 }, format: { with: /\p{katakana}/ }
  validates :first_name_kana, presence: true, length: { in: 1..50 }, format: { with: /\p{katakana}/ }
  validates :nickname, presence: true, length: { in: 1..15 }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 120, message: "は0から120までが登録できます" }

  def self.guest
    find_or_create_by!(nickname: 'ゲスト会員' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.first_name = 'ゲスト'
      customer.first_name_kana = '会員'
      customer.last_name = 'ゲスト'
      customer.last_name_kana = 'カイイン'
      customer.nickname = 'ゲスト会員'
      customer.phone_number = 00012344321
      customer.age = 20
      customer.is_deleted = false
    end
  end

end
