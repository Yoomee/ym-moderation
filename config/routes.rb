Rails.application.routes.draw do
  resources :flaggings, :only => [:new, :create]
end
