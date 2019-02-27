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

  resources :quests do
    resources :events
  end

  get '/api/quests' => 'quests_api#index'
  get '/api/quests' => 'quests_api#new'
  post '/api/quests' => 'quests_api#create'
  get '/api/quest/:id' => 'quests_api#show'
  patch '/api/quest/:id' => 'quests_api#update'

  get '/api/quest/:quest_id/events' => 'events_api#index'
end
