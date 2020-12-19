Rails.application.routes.draw do
  devise_for :users
  root 'cin_details#index'  
  get '/search', to: 'cin_details#index'
  post '/search', to: 'cin_details#create_cin_number_details'
  get '/history', to: 'cin_details#history'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
