Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'blog/new'
  devise_for :users
  resources :blogs
  resources :blogs do
  resources :comments
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
