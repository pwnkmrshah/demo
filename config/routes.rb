Rails.application.routes.draw do
  root 'home#index'
  
  resources :books
  
  resources :users, only: [:new, :index, :create, :show]
  
  resources :home, only: [:index, :show]
  
  get '/show' => 'home#show', as: 'show' 
  
  resources :sessions, only: [:new, :create]
  
  get 'signup', to: 'users#new', as: 'signup' 
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  
  get 'issue_form' => 'issue_books#new', as: 'issue_form'
  get 'submit_issued_book' => 'issue_books#submit_issued_book', as: 'submit_issued_book'
  post '/issue_books/submit_issued_book' => 'issue_books#submit_issued_book'
  get 'manage_book' => 'issue_books#manage_book', as: 'manage_book'
  post '/issue_books/issue' => 'issue_books#issue_book', as: 'issue_book'
  post '/issue_books/submit' => 'issue_books#submit_book', as: 'submit_book'
  
end

