Rails.application.routes.draw do
  root to: 'movies#index'
  get "/movies", to: "movies#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
