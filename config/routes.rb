Rails.application.routes.draw do
  resources :mining_types
  get('welcome/index', to: 'welcome#index')
  get('welcome/json', to: 'welcome#hello_world_json')

  resources :coins

  root(to: 'welcome#index')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
