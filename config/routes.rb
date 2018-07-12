Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'blog/new'
  devise_for :users
  resources :blogs
 	resources :blogs do
  	resources :comments do
  		resources :replies
		end
	end
  resources :comments, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
