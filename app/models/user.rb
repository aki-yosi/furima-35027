class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :nickname, presence: true
 validates :family_name, presence: true
 validates :first_name, presence: true
 validates :family_name_kana, presence: true
 validates :first_name_kana, presence: true
 validates :birth_day, presence: true

 has_many :products
 has_many :purchases


 validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英数文字を使用してください' }
 validates :email, format: { with: /@.+/, message: '@を使用してください' }
 with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'カナ文字を使用してください' } do
  validates :first_name_kana
  validates :family_name_kana
end
end