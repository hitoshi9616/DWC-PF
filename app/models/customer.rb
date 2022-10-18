class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  #validates :last_name, presence: true
  #validates :first_name, presence: true
  #validates :last_name_kana, presence: true
  #validates :first_name_kana, presence: true
  #validates :nickname, presence: true
  #validates :phone_number, presence: true
  #validates :age, presence: true
  #validates :email, presence: true
  #validates :encrypted_password, presence: true

  def self.guest
    find_or_create_by!(last_name: 'guestcustomer' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
  end

end
