Rails.application.routes.draw do
  root          to: "ideas#index"
  get "/ideas", to: "ideas#index"

  namespace :api do
    namespace :v1 do
      resources :ideas, only: [:index, :create, :destroy], defaults: { format: :json }
    end
  end
end
