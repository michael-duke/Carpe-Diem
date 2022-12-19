class GroupExpense < ApplicationRecord
  belongs_to :groups
  belongs_to :expenses
end
