Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        resources :most_revenue, only: [:index]
        resources :revenue, only: [:index]
        resources :find, only: [:index]
        resources :find_all, only: [:index]
        resources :most_items, only: [:index]
      end
      namespace :invoices do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
      end

      namespace :customers do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
      end

      resources :customers, only: [:index, :show] do
        resources :favorite_merchant, only: [:index]
      end

      resources :invoices, only: [:show, :index] do
        resources :transactions, only: [:index], to: 'invoices/transactions#index'
        resources :merchants, only: [:index], to: 'invoices/merchants#index'
        resources :items, only: [:index], to: 'invoices/items#index'
        resources :customers, only: [:index], to: 'invoices/customers#index'
      end

      resources :merchants, only: [:show, :index] do
        resources :revenue, only: [:index]
        resources :favorite_customer, only: [:index]
      end

      namespace :items do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
        resources :most_revenue, only: [:index]
        resources :most_items, only: [:index]
      end
      resources :items, only: [:index, :show] do
        resources :best_day, only: [:index]
      end
      namespace :transactions do
        resources :find, only:[:index]
        resources :find_all, only: [:index]
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
