Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # chapters
  resources :mangas
    resources :chapters do
      # for access /chapters/view
      get '/mangas/:manga_id/chapters/:id', to: 'chapters#show'
      # for access /chapters/new
      get '/mangas/:manga_id/chapters/new', to: 'chapters#new'
    end
end
