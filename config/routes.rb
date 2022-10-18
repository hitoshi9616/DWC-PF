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
      resources :reviews do
        resources :review_comments
      end
    resources :posts do
      resources :post_comments
    end
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers
    resources :genres
    get "item/confirm/:id" => "items#confirm", as: "item/confirm"
    resources :items
    get "post/confirm/:id" => "posts#confirm", as: "post/confirm"
    resources :posts
    resources :post_comments
    resources :reviews
    resources :review_comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
