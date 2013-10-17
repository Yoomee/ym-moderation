Rails.application.routes.draw do
  get '/moderation' => 'flags#index', :as => 'flags'
  resources :flags, :only =>[:show] do
    member do
      put :resolve
    end
  end
  resources :flaggings, :only => [:new, :create]
  resources :flagging_categories, :except => [:show] do
    resources :flags, :only => [:index], :path => 'moderation'
  end
end
