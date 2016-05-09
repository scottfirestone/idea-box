Rails.application.routes.draw do
  get "/ideas", to: "ideas#index"
end
