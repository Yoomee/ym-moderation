Rails.application.routes.draw do
  resources :flags, :only =>[:index]
  resources :flaggings, :only => [:new, :create]
end
