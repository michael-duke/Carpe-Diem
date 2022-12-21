require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before :each do
    @user = User.create(name: 'Cassian Andor', email: 'cassian@rebels.com', password: '123456')
    @category = Group.create(author: @user, name: 'Soup',
                             icon: 'https://www.flaticon.com/svg/static/icons/svg/3144/3144456.svg')

    visit root_path
    click_link 'Log In'

    within('#new_user') do
      fill_in 'email', with: 'cassian@rebels.com'
      fill_in 'password', with: '123456'
    end
    click_button 'Log in'
  end

  it 'visits categories page' do
    expect(current_path).to match groups_path
    expect(page).to have_content 'Soup'
  end

  it 'redirects to transactions page of the category' do
    within("#group_#{@category.id}") do
      click_on @category.name
    end
    expect(current_path).to match group_expenses_path(@category)
  end
end
