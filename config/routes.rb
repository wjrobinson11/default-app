Rails.application.routes.draw do
	root to: 'pages#home'

  devise_for :users, path: 'auth', controllers: {
    registrations: "auth/registrations",
    sessions: "auth/sessions"
  }

  resources :contests
end
