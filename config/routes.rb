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
    resources :genres, except: [:new, :update, :destroy]
    resources :items
    resources :end_users, except: [:new, :create]
  end
  namespace :public do
    resources :items, only: [:show]
    resource :end_user, only: [:show, :edit, :update]
    get "end_user/withdrawal" => "end_users#withdrawal", as: :end_user_withdrawal
    root "items#index", as: :root
    resources :cart_items, except: [:new, :edit]
    delete "/cart_items" => "cart_items#destroy_all", as: :destroy_cart_items
end
end
