Rails.application.routes.draw do
  get 'home/top'
  resources :users, :only => [:new, :create, :show]
  # get "users/new" => "users#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
