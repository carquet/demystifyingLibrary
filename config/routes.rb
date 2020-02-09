Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hello' => 'application#say_hello'
  get 'hello/:name' => 'application#say_hello'
  get 'list_books'  => 'application#list_books'
end
