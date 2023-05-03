class BookmarksController < ApplicationController
  def create
    @manga = Manga.find(params[:manga_id])
    @bookmarks = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @bookmark.manga = @manga
    if @bookmark.save!
      redirect_to @manga, notice: 'You bookmarked this manga!'
    else
      render manga_path(@manga)
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:manga_id)
  end
end
