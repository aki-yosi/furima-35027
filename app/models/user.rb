class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 with_options presence: true do
    validates :nickname
    validates :birth_day
 end

 has_many :products


  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英数文字を使用してください' }
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角（カタカナ）を使用してください' } do
    validates :first_name_kana
    validates :family_name_kana
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角を使用してください' } do
    validates :family_name
    validates :first_name
  end
end