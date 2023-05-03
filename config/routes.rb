Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

 # chapters
  resources :mangas do
      get 'upload_manga', to: 'mangas#new'
      resources :chapters
      resources :chapter_reviews, only: [:new, :create, :destroy]

      #get top manga ranking
      collection do
        get :top
      end

      resources :manga_reviews, only: [:new, :create, :destroy]
  end

  get "dashboard", to: "pages#dashboard"
end
