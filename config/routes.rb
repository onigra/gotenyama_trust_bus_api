Rails.application.routes.draw do
  get "/bus/:from_place", to: "bus#show"
  get "/busall/:from_place", to: "busall#show"
end
