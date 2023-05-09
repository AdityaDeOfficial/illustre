class BookmarksController < ApplicationController
  # POST /mangas/:manga_id/bookmarks
  def create
    # @manga = Manga.find(params[:manga_id])
    @manga = Manga.find(params[:manga_id])
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.manga = @manga
    if @bookmark.save
      redirect_to @manga, notice: 'You bookmarked this manga!'
    else
      render "mangas/show"
    end
  end

  # DELETE /bookmarks/:id
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @manga = @bookmark.manga
    @bookmark.destroy
    redirect_to manga_path(@manga), notice: 'Successfully deleted bookmark'
  end

  # private

  # # def bookmark_params
  # #   params.require(:bookmark).permit(:manga_id)
  # # end
end
