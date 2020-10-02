class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :birthday, presence: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  validates :surname, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  VALID_PHONETIC_REGEX = /\A[ァ-ヶー－]+\z/
  validates :surname_phonetic, presence: true, format: { with: VALID_PHONETIC_REGEX }
  validates :first_name_phonetic, presence: true, format: { with: VALID_PHONETIC_REGEX }

  has_many :items
  has_many :orders

end
