Rails.application.routes.draw do
  mount Shoppe::Engine => "/shoppe"
  resources :guests

  get "product/:permalink", to: "products#show", as: "product"
  post "product/:permalink", to: "products#buy", as: "buy"

  post "product/:permalink", to: "products#buy"

  get "basket", to: "orders#show"

  delete "basket", to: "orders#destroy"

  match "checkout", to: "orders#checkout", as: "checkout", via: [:get, :patch]
  # match "checkout/pay", to: "orders#payment", as: "checkout_payment", via: [:get, :post]
  match "checkout/confirm", to: "orders#confirmation", as: "checkout_confirmation", via: [:get, :post]

  resources :guests, except: :show

  get 'tickets', to: 'welcome#tickets'

  root 'welcome#home'
end
