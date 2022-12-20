require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  before :each do
    @user = User.create(name: 'Cassian Andor', email: 'cassian@rebels.com', password: '123456')
    @category = Group.create(author: @user, name: 'Soup',
                             icon: 'https://www.flaticon.com/svg/static/icons/svg/3144/3144456.svg')
    @transaction = Expense.create(author: @user, name: 'Tomato Soup', amount: 10, groups: [@category])

    visit root_path
    click_link 'Log In'

    within('#new_user') do
      fill_in 'email', with: 'cassian@rebels.com'
      fill_in 'password', with: '123456'
    end
    click_button 'Log in'
    visit group_expenses_path(@category)
  end

  it 'visits categories page' do
    expect(page).to have_content 'Soup\' Transactions'
  end

  it 'should have total transactions price' do
    expect(page).to have_content "Cassian Andor : $#{@transaction.amount}"
  end
end
