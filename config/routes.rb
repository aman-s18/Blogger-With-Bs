Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
  post '/likes' => 'likes#create', as: :like_create
 post '/dislikes' => 'likes#dislike', as: :dislike_create




  resources :comments, only: [:index, :new, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
