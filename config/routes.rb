Rails.application.routes.draw do
  resources :employees do
  	member do
  		get 'show_laptops'
  	end
  end
  root 'employees#index'
end
