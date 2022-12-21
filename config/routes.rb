Rails.application.routes.draw do
  devise_for :users
  
  root 'users#splash'
  #root 'users#index'
  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end
  
  resources :users
  resources :groups, :path => "categories" do 
    resources :expenses, :path => "transactions"
  end
end
