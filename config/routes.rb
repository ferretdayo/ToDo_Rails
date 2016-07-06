Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'users#index'
  get 'login'   => 'sessions#new'
  get 'signup'  => 'users#new'
end
