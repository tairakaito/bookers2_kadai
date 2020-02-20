Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
resources :books, only: [:new, :create, :index, :show]
root 'homes#home'
get 'home/about' => 'homes#about'
end
