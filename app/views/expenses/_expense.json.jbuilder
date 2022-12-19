json.extract! expense, :id, :users_id, :name, :amount, :created_at, :updated_at
json.url expense_url(expense, format: :json)
