Rails.application.routes.draw do
	authenticated do
	  root :to => 'contests#index', as: :authenticated
	end

	root to: 'pages#home'

  devise_for :users, path: 'auth', controllers: {
    registrations: "auth/registrations",
    sessions: "auth/sessions",
    passwords: "auth/passwords"
  }

  resources :contests
end
