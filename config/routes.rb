Rails.application.routes.draw do
  root          to: "ideas#index"
  resources :ideas, except: :index, defaults: {format: :json}
end
