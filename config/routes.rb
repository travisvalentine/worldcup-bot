WorldcupBot::Application.routes.draw do
  resources :gifs, only: [:index] do

  end

  resources :links, only: [:show]

  resources :matches, only: [:index] do
    collection do
      get "tomorrow"
    end
  end

  resources :odds, only: [:index]

  resources :scores, only: [:index, :show] do
    collection do
      get "now"
      get "recap"
    end
  end

  resources :teams, only: [:show, :index]

  resources :groups, only: :show

end
