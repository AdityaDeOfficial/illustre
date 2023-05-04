Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

 # chapters 
 resources :mangas
  get 'upload_manga', to: 'mangas#new'
   resources :chapters do
     # for access /chapters/view
     get '/mangas/:manga_id/chapters/:id', to: 'chapters#show'
     # for access /chapters/new
     get '/mangas/:manga_id/chapters/new', to: 'chapters#new'
   end
 
 resources :users
 get "dashboard", to: "pages#dashboard"
end