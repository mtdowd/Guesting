require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "landings#show"
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :bars do
    member do
      post "join" => "bar_gig_memberships#create"
      delete "leave" => "bar_gig_memberships#destroy"
    end
    resources :shifts
  end

  resources :shifts do
    member do
      post "take" => "shift_memberships#create"
      delete "return" => "shift_memberships#destroy"
    end
  end

  resources :manager_profiles, only: [:new, :create]
  resources :bartender_profiles, only: [:new, :create]
end
