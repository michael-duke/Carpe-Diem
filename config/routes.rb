Rails.application.routes.draw do
  
  root 'users#index'
  
  resources :users do
    resources :groups, as: "categories" do 
      resources :expenses, as: "transactions"
    end
  end
end
