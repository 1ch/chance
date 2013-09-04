Chance::Application.routes.draw do

  get "learns/index"

  get "learn/index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root:to => 'sessions#new'

  match 'cookings/create' => 'cookings#create', :via => 'get'

  match 'learns/' => 'learns#index', :via => 'get'
  match 'learns/' => 'learns#index', :via => 'post'

  resources :cookings do
          member do
                  get 'puts_image'
          end
  end
end
