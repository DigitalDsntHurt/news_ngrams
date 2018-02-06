Rails.application.routes.draw do
  resources :ngrams
  resources :url_queues
  root 'url_queues#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
