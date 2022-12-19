class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 1..15 },
                   uniqueness: { scope: :author, message: 'You already have a category with this name' }
  validates :icon, presence: true, length: { in: 1..50 }

  belongs_to :author, class_name: 'User'
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses, dependent: :destroy
end
