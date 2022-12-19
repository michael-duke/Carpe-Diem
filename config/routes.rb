Rails.application.routes.draw do
  
  root 'users#index'

  resources :users
  resources :groups, :path => "categories" do 
    resources :expenses, :path => "transactions"
  end
end
