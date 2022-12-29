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

  it 'should get new if signed in' do
    get new_group_expense_path(@category)
    expect(response).to have_http_status(:ok)
  end

  it 'should not get new if signed out' do
    sign_out @user
    get new_group_expense_path(@category)
    expect(response).to have_http_status(:redirect)
  end

  it 'should make a post with success message' do
    get new_group_expense_path(@category)
    post group_expenses_path(@category), params: { expense: { name: 'Avengers: Endgame', amount: 10.99 } }

    get group_expenses_path(@category)
    expect(response.body).to match 'Expense was successfully created.'
  end

  it 'should redirect to new with status unprocessable_entity if name is nil' do
    get new_group_expense_path(@category)
    post group_expenses_path(@category), params: { expense: { name: nil, amount: 10.99 } }
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it "renders 'index' template" do
    expect(response).to render_template('index')
  end
end
