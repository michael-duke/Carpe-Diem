require 'rails_helper'

RSpec.feature 'Log In', type: :feature do
  before :each do
    @user = User.create(name: 'Luke Skywalker', email: 'darth@vader.com', password: '123456')
    visit root_path
    click_link 'Log In'
  end

  it 'signs me in' do
    within('#new_user') do
      fill_in 'email', with: 'darth@vader.com'
      fill_in 'password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  it 'should not sign me in when the credentials are not correct' do
    within('#new_user') do
      fill_in 'email', with: 'padmain@vader.com'
      fill_in 'password', with: '123456'
    end
    click_button 'Log in'
    expect(current_path).to match new_user_session_path
    expect(page).to have_content 'Invalid Email or password'
  end
end
