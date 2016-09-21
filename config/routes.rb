Rails.application.routes.draw do

  mount Shoppe::Engine => "/admin"

  # get "shop/:permalink", to: "products#show", as: "product"
  # post "shop/:permalink", to: "products#buy", as: "buy"

  # get 'shop', to: "products#index"

  # get "basket", to: "orders#show"

  # delete "basket", to: "orders#destroy"

  # match "checkout", to: "orders#checkout", as: "checkout", via: [:get, :patch]
  # # match "checkout/pay", to: "orders#payment", as: "checkout_payment", via: [:get, :post]
  # match "checkout/confirm", to: "orders#confirmation", as: "checkout_confirmation", via: [:get, :post]
  # match "checkout/confirmed", to: "orders#confirmed", as: "checkout_confirmed", via: [:get, :post]
  # get "basket", to: "orders#show"
  # delete "basket", to: "orders#destroy"

  


  resources :guests, except: [:index, :show]
  
  get 'tickets', to: 'welcome#tickets'

  root 'welcome#home'
  
end
