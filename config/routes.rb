Rails.application.routes.draw do
  resources :savedmsgs
  root 'welcome#index'
  get 'welcome/index'
  get '/messages/:id' => 'welcome#read'
  post '/' => 'welcome#new'
end
