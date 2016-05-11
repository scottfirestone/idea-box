Rails.application.routes.draw do
  root          to: "ideas#index"
  get "/ideas", to: "ideas#index"

  namespace :api do
    namespace :v1 do
      put "ideas/:id/upvote", to: "ideas#upvote"
      resources :ideas, only: [:index, :create, :destroy, :update],
        defaults: { format: :json }
    end
  end
end
