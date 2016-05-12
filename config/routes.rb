Rails.application.routes.draw do
  root          to: "ideas#index"

  namespace :api do
    namespace :v1 do
      put "ideas/:id/upvote",   to: "ideas#upvote"
      put "ideas/:id/downvote", to: "ideas#downvote"
      resources :ideas, only: [:index, :create, :destroy, :update],
        defaults: { format: :json }
    end
  end
end
