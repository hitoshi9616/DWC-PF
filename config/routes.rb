Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get "homes/about" => "homes#about", as: "about"
    resources :customers
    resources :items
    #itemsに対してreviewsをネストしないのはレビュー一覧で全てのレビュー情報を表示するため
    get "review/confirm/:id" => "reviews#confirm", as: "review/confirm"
    resources :reviews do
      resources :review_comments
    end
    get "post/confirm/:id" => "posts#confirm", as: "post/confirm"
    resources :posts do
      resources :post_comments
    end
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "customers/:id/reviews" => "customers#review", as: "customer/reviews"
    get "customers/:id/posts" => "customers#post", as: "customer/posts"
    resources :customers
    resources :genres
    get "item/confirm/:id" => "items#confirm", as: "item/confirm"
    resources :items
    get "post/confirm/:id" => "posts#confirm", as: "post/confirm"
    resources :posts
    resources :post_comments
    get "review/confirm/:id" => "reviews#confirm", as: "review/confirm"
    resources :reviews
    resources :review_comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
