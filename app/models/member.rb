class Member < ApplicationRecord
  has_secure_password
  has_many :orders, dependent: :destroy

  validates :name, presence: true, length: {maximum:30, allow_blank: true }, uniqueness: true
  validates :fullname, presence: true, length: {maximum:21, allow_blank: true }
  validates :adress, presence: true
  validates :email, email: {allow_blank: true}
  validates :password, length: {minimun: 8, maximum:21 , allow_blank: true },
  format: {
    with: /\A[A-Za-z][A-Za-z0-9]*\z/,
    allow_blank: true
  }
  validates :phone,presence: true,
    format: { with: /\A[0-9\-\(\)]*\z/, allow_blank: true },
    length: { minimum: 8, maximum: 20, allow_blank: true },
    uniqueness: true
end
