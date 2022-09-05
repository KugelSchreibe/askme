Rails.application.routes.draw do
  root to: 'questions#index'
  
  resources :questions do
    put :hide, on: :member
  end

  resource :session, only: %i[new create destroy]
  resources :users, except: %i[index show edit update]

  get 'users/:nickname', to: 'users#show'
  get 'users/:nickname/edit', to: 'users#edit'
  patch 'users/:nickname', to: 'users#update'
end
