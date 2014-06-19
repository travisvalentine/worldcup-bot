WorldcupBot::Application.routes.draw do
  root to: "info#home"

  resources :gifs, only: [:index] do
    collection do
      get "recap"
    end
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
