WorldcupBot::Application.routes.draw do
  root to: "info#home"

  resources :cards, only: [:index] do
    collection do
      get "team"
    end
  end

  resources :gifs, only: [:index] do
    collection do
      get "recap"
    end
  end

  resources :hosts, only: [] do
    collection do
      post "last_goal"
    end
  end

  resources :links, only: [:show]

  resources :matches, only: [:index] do
    collection do
      get "played"
      get "tomorrow"
    end
  end

  resources :odds, only: [:index]

  resources :scores, only: [:index, :show] do
    collection do
      get "live"
      get "now"
      get "recap"
    end
  end

  resources :teams, only: [:show, :index]

  resources :groups, only: :show

end
