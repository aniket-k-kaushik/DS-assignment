Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root "homes#index"
  resources :referrals, only: [:new, :create] do
    member do
      get :resend_referral
    end
  end
  resources :homes, only: [:index]
end
