Rails.application.routes.draw do
  resources :ufvaluerequests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/uf/:date", to: 'ufvaluerequests#uf'
  get "/client/:name", to: 'ufvaluerequests#my_requests'
end
