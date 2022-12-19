class User < ApplicationRecord
  validates :name, presence: true, length: { in: 1..15 }
  # validates :email, presence: true, length: { in: 1..50 }, uniqueness: true
  # validates :password, presence: true, length: { in: 6..20 }

  has_many :groups, foreign_key: :author_id, dependent: :destroy
  has_many :expenses, foreign_key: :author_id, dependent: :destroy
end
