

Rails.application.routes.draw do

  # root 'books#book_details'
  root 'home#index'
  resources :book, :users

  get '/sessions/sessions/new' => 'sessions#new'
  get 'users/sessions/new' => 'sessions#new'
  get '/books/users/new' => 'sessions#new'
  get '/books/home/index' => 'home#index'
  get  '/sessions/home/index' => 'home#index'

  get 'signup', to: 'users#new', as: 'signup' 
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'


  resources :sessions, only: [:new, :create]
  get '/sessions' => 'sessions#new'

  get '/home/index', to:'home#index', as: 'home' 

  get 'books/new'
  get '/books/books/new' => 'books#new'
  post 'books/create'

  get 'books/submit'
  get '/books/books/submit' => 'books#submit'
  post 'books/submit'

  get 'books/book_details' => 'books#book_details', as: 'book_details'

  get 'issue_form' => 'issue_books#new', as: 'issue_form'
  
  get 'submit_issued_book' => 'issue_books#submit_issued_book', as: 'submit_issued_book'

  post '/issue_books/submit_issued_book' => 'issue_books#submit_issued_book'

  get 'manage_book' => 'issue_books#manage_book', as: 'manage_book'

  post '/issue_books/issue' => 'issue_books#issue', as: 'issue_book'


  post '/issue_books/submit' => 'issue_books#submit', as: 'submit_book'

end

