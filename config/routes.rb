Rails.application.routes.draw do
  devise_for :users
  root 'mangas#index'

  resources :mangas do
    resources :manga_reviews, only: [:create, :update, :destroy]
    resources :bookmarks, only: [:create, :destroy]
    resources :chapters do
      resources :chapter_reviews, only: [:create, :update, :destroy]
    end
    #get top manga ranking
    collection do
      get :top
    end
  end

  get "dashboard", to: "pages#dashboard"
  resources :bookmarks, only: [:destroy]
end
