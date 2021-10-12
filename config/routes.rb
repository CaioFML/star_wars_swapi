Rails.application.routes.draw do
  resources :people, only: %i[index]

  root to: "people#index"
end
