Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/auth/twitch/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    resources :quests
  end
end
