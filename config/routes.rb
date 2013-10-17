Rails.application.routes.draw do
  get '/moderation' => 'flags#index', :as => 'flags'
  resources :flags, :only =>[:show]
  resources :flaggings, :only => [:new, :create]
  resources :flagging_categories, :except => [:show] do
    resources :flags, :only => [:index], :path => 'moderation'
  end
end
