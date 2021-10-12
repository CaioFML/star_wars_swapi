Rails.application.routes.draw do
  resources :people, only: %i[index show]
  resources "/change_introduction_language/:id",
            to: "change_introduction_language#create",
            only: :create,
            as: :change_introduction_language

  root to: "people#index"
end
