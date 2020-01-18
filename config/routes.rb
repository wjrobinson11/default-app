Rails.application.routes.draw do
	authenticated do
	  root :to => 'pages#dashboard', as: :authenticated
    resources :ads
	end

	root to: 'pages#home'

  devise_for :users, path: 'auth', controllers: {
    registrations: "auth/registrations",
    sessions: "auth/sessions",
    passwords: "auth/passwords"
  }

  get '/instagram_accounts_lookup', to: 'social_profiles#instagram_accounts_lookup'
  get '/facebook_pages_lookup', to: 'social_profiles#facebook_pages_lookup'
end
