class Member < ApplicationRecord
  has_secure_password
  has_many :orders, dependent: :destroy

  validates :name, presence: true, length: {maximum:29, allow_blank: true }, uniqueness: true
  validates :fullname, presence: true, length: {maximum:20, allow_blank: true }
  validates :address, presence: true
  validates :email, email: {allow_blank: true}, uniqueness: true
  validates :phone,presence: true, format: { with: /\A[0-9\-\(\)]*\z/, allow_blank: true }
  validates :password, length: {minimum: 7, maximum:20, allow_blank: true },
    format: {
      with: /\A[A-Za-z][A-Za-z0-9]*\z/,
      allow_blank: true
    }
end
