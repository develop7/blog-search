Rails.application.routes.draw do
  get 'search', to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get ':domain', to: 'posts#index'
  get ':domain/:slug', to: 'posts#show'
end
