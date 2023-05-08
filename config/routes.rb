Rails.application.routes.draw do
  devise_for :users
  root 'mangas#index'

  resources :mangas do
    resources :chapters, shallow: true
    resources :chapter_reviews, only: [:new, :create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
    #get top manga ranking
    collection do
      get :top
    end

    resources :manga_reviews, only: [:new, :create, :destroy]
  end

  get "dashboard", to: "pages#dashboard"
  resources :bookmarks, only: [:destroy]
end
