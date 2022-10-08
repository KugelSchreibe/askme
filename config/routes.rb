Rails.application.routes.draw do
  root to: 'questions#index'
  
  resources :questions do
    put :hide, on: :member
  end

  resource :session, only: %i[new create destroy]
  resources :users, except: %i[index], param: :nickname

  get '/hashtags/:hashtag', to: 'questions#questions_by_hashtag'
end
