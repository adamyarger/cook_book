Rails.application.routes.draw do
  
  devise_for :users

  mount Soulmate::Server, :at => "/autocomplete"
  
  root 'static_pages#root'

  resources :recipes

end
