Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  
  resources :notes do
    collection do
      get 'search'
    end
  end

end
