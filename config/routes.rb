Rails.application.routes.draw do
  resources :costs
  root 'costs#index'
end
