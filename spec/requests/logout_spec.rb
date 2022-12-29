require 'rails_helper'

RSpec.describe 'Log Out', type: :request do
  before :each do
    @user = User.create(name: 'Bix Caleen', email: 'bix@caleen.com', password: '123456')

    sign_in @user
    get groups_path
  end

  it 'current path is categories home page' do
    expect(request.path).to match groups_path
  end

  it 'can\'t access homepage after sign out' do
    sign_out @user
    get groups_path
    expect(response).to have_http_status(:redirect)
  end

  it "renders 'splash' template after sign out" do
    sign_out @user
    get root_path
    expect(response).to render_template('splash')
  end
end
