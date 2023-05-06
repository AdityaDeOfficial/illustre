class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    #display bookmark belongs to user show 5 ? to see more go to my bookmark.all page
    @bookmarks = current_user.bookmarks #works as an array

    #display manga belongs to user show 10? to see more go to my manga.all page
    @mangas = current_user.mangas
    # OR @manga.all.user = current_user? #latest 10?
  end

  def all_my_manga

  end

  def all_my_bookmark

  end

  private

  def set_boomark
    @bookmark = current_user.bookmarks.find(params[:id])
  end
end
