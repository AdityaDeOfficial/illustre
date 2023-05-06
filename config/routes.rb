Rails.application.routes.draw do
  devise_for :users
  root 'mangas#index'
  resources :mangas do
    resources :chapters, shallow: true
  end

 resources :users
 get "dashboard", to: "pages#dashboard"
end
