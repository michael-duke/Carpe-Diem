require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before :each do
    @user = User.create(name: 'Bix Caleen', email: 'bix@caleen.com', password: '123456')

    Group.create([
                   { author: @user, name: 'Entertainment',
                     icon: 'https://www.flaticon.com/svg/static/icons/svg/3144/3144456.svg' },
                   { author: @user, name: 'Appliances', icon: 'https://www.flaticon.com/svg/static/icons/svg/3144/3144456.svg' }
                 ])

    sign_in @user
    get groups_path
  end

  it 'assigns all categories to @groups' do
    expect(assigns(:groups)).to eq(@user.groups)
  end

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    expect(response).to render_template('index')
  end
end
