Rails.application.routes.draw do
  
  root 'users#index'

  resources :users do
    resources :groups, :path => "categories" do 
      resources :expenses, :path => "transactions"
    end
  end
end
