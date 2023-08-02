Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :games, only: [:index, :new, :show, :edit]
    resources :customers, only: [:index, :show, :edit]
    resources :posts, only: [:show]
    resources :jenres, only: [:index, :create, :edit]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about',as: 'about'

    get 'games' => 'games#index'
    get 'games/:id' => 'games#show',as: 'games/show'

    get 'current_customer/show' => 'customers#show'
    get 'current_customer/information/edit' => 'customers#edit'
    patch 'current_customer/show' => "customers#update"
    put 'current_customer/show' => "customers#update"
    get 'current_customer/unsubscribe' => 'customers#unsubscribe',as: 'unsubscribe'
    patch 'current_customer/withdrawal' => 'customers#withdrawal',as: 'withdrawal'

    get 'posts/new' => 'posts#new'
    get 'posts' => 'posts#index'
    get 'posts/:id' => 'posts#show',as: 'posts/show'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
