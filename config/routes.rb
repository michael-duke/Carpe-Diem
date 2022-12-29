Rails.application.routes.draw do
  devise_for :users
  
  root 'users#splash'
  #root 'users#index'
  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end
  
  resources :users, only: [:splash]
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy], :path => "categories" do 
    resources :expenses, only: [:index, :new, :create, :edit, :update, :destroy], :path => "transactions"
  end
end
