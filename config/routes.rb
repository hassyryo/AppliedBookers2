Rails.application.routes.draw do
  get 'users' ,to: 'users#index' ,as: 'users'
  get 'books' ,to: 'books#index' ,as: 'books'
  get 'home/about' ,to: 'homes#about', as: 'home_about'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
  root to: 'homes#top'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
