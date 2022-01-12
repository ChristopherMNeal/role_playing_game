Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  resources :users do
    resources :characters do
      resources :inventories
    end
  end
end
