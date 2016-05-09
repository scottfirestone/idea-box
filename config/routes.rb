Rails.application.routes.draw do
  root          to: "ideas#index"
  get "/ideas", to: "ideas#index"
end
