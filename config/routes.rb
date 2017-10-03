Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
      end
      resources :merchants, only: [:show, :index]

      namespace :items do
        resources :find, only: [:index]
        resources :find_all, only: [:index]
      end
      resources :items, only: [:index, :show]
    end
  end
end
