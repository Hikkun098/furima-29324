class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, inclusion: { in: @ }
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :birthday, presence: true,
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  validates :surname, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :phonetic_name1, presence: true, format: { with: VALID_NAME_REGEX }
  validates :phonetic_name2, presence: true, format: { with: VALID_NAME_REGEX }

end
