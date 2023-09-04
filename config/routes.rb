Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#new_guest'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :games, only: [:index, :new, :show, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, only: [:show, :destroy] do
      resources :comments, only: [:destroy]
    end
    # resources :jenres, only: [:index, :create, :edit, :update]
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    # get '/about' => 'homes#about',as: 'about'

    get 'games/search' => "games#search"
    resources :games, only: %i[show], params: :item_code
    # get 'games' => 'games#index'
    get 'games/:id' => 'games#show',as: 'games/show'
    resources :games, only: [:new, :create]


    get 'current_customer/show' => 'customers#show'
    get 'current_customer/information/edit' => 'customers#edit'
    patch 'current_customer/show' => "customers#update"
    put 'current_customer/show' => "customers#update"
    get 'current_customer/unsubscribe' => 'customers#unsubscribe',as: 'unsubscribe'
    patch 'current_customer/withdrawal' => 'customers#withdrawal',as: 'withdrawal'

    # get 'posts/new' => 'posts#new'
    # post 'posts' => 'posts#create'
    # get 'posts' => 'posts#index'
    # get 'posts/:id' => 'posts#show',as: 'posts/show'
    get "search" => "posts#search"

    resources :posts, only: [:new, :create, :index, :show, :edit, :update] do
      resources :comments, only: [:create]
    end



  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
