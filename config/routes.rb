Rails.application.routes.draw do
  resources :todo_lists
	get 'sessions/new'

	resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 									'users#index'
	get 		'signup'  => 	'users#new'
	get 		'login'   => 	'sessions#new'
	post		'login'		=> 	'sessions#create'
	delete	'logout'	=>	'sessions#destroy'
	get			'todo'		=>	'todo_lists#index'
end

