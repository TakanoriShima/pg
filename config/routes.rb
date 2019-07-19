Rails.application.routes.draw do
  #get 'user/index'
  root 'user#index'
  get '/user_new', to:'user#new'
  post '/user_create', to:'user#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
