Rails.application.routes.draw do
  root 'products#index'

  resource :cart do
    post 'add', path: 'add/:id'
    get 'checkout'
  end

  resources :orders, only:[:new, :create]

  resources :products, only:[:index, :show]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :backend do
    get 'dashboard', to:'dashboard#index'
    resources :products, except:[:show]
    resources :categories, except:[:show]
  end
end
