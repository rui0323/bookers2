Rails.application.routes.draw do
  get 'home/about'=>'homes#about'
  get 'users/new'
  #patch 'book_paramss/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  root to: "homes#top"
  devise_for :users
  
  resources :books, only: [:new, :create, :index, :show, :edit,:update]
  resources :users, only: [:show, :edit, :index,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
