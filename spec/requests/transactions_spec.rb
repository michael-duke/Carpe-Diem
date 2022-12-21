require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  before :each do
    @user = User.create(name: 'Samiullah', email: 'samiullahk997@gmail.com', password: 'samiullahk997')
    @category = Group.create(author: @user, name: 'Movies')
    Expense.create([
                     { author: @user, name: 'Avengers: Infinity', amount: 10, groups: [@category] },
                     { author: @user, name: 'Andor', amount: 12, groups: [@category] }
                   ])

    sign_in @user
    get group_expenses_path(@category)
  end

  it 'assigns all expenses to @expenses' do
    expect(assigns(:expenses)).to eq(@user.expenses.order(created_at: :desc))
  end

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    expect(response).to render_template('index')
  end
end
