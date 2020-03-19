Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hello' => 'application#say_hello'
  get 'hello/:name' => 'application#say_hello'
  get '/list_books'  => 'application#list_books'
  get '/show_book/:id'   => 'application#show_book'
  get '/new_book'  => 'application#new_book'
  post '/create_book' => 'application#create_book'
  get '/edit_book/:id' => 'application#edit_book'
  post '/update_book/:id' => 'application#update_book'
  post '/delete_book/:id' => 'application#delete_book'
  post '/create_review/:book_id' => 'application#create_review'
end
