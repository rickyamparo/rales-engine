Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
      end
      namespace :invoices do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
      end
      resources :invoices, only: [:show, :index]
      resources :merchants, only: [:show, :index]
    end
  end
end
