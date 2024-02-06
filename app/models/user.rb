class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, presence: true
validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力して下さい。' }
validates :last_name_kana, :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります。' }

end
