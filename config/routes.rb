Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords, :registrations], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :customer do
    get 'customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
    post 'customers', to: 'public/registrations#create', as: :customer_registration
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    resources :customers, only: [:index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    get 'search' => 'items#search'
  end

  scope module: :public do
    root to:'homes#top'
    get '/about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resource :customers, only: [:edit, :update]
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:index, :new, :show, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
