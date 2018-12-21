Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "front/homepage#index"

  scope module: :front do
    get 'homepage', action: :index, controller: 'homepage'
  end

  scope module: :api do
    namespace :v1 do
      post 'parent_sign_up',  action: :sign_up, controller: 'parents'
      post 'parent_sign_in',  action: :sign_in, controller: 'parents'
      post 'parent_refresh',  action: :refresh, controller: 'parents'
      delete 'parent_logout', action: :logout,  controller: 'parents'
      resources :parents, only: [:show, :update] do
        resources :kids, only: [:index, :show, :create, :update, :destroy] do
          resources :activities, only: [:index, :show, :create, :update, :destroy]
        end
      end
      resources :journeys, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
