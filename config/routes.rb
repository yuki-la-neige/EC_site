Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }


  namespace :admin do
    root "top#index", as: :root
    resources :items
    resources :genres, except: [:new, :destroy]
    resources :end_users, except: [:new, :create]
    patch "end_users/:id" => "end_users#withdrawal"
    resources :orders, only: [:index, :show, :update]
  end
  namespace :public do
    root "items#index", as: :root
    resources :items, only: [:show]
    get "end_user/withdrawal" => "end_users#withdrawal", as: :end_user_withdrawal
    resource :end_user, only: [:show, :edit, :update, :destroy] do
      resources :cart_items, except: [:new, :edit, :show]
      delete "/cart_items" => "cart_items#destroy_all", as: :destroy_cart_items
    end
    resources :orders, only: [:index, :new, :create]
    get "orders/new_confirmation" => "orders#new_confirmation", as: :order_new_confirmation
    get "orders/completion" => "orders#completion"
    resources :addresses, except: [:new, :show]
  end
end
