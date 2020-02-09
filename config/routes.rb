Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hello' => 'application#say_hello'
  get 'hello/:name' => 'application#say_hello'
  get '/list_books'  => 'application#list_books'
  get '/show_book/:id'   => 'application#show_book'
  get '/new_book'  => 'application#new_book'
  post '/create_book' => 'application#create_book'
end
