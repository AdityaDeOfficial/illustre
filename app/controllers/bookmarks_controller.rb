class BookmarksController < ApplicationController
  def new
    @manga = Manga.find(params[:manga_id])
    @bookmark = Bookmark.new
  end

  def create
    @manga = Manga.find(params[:manga_id])
    @user = current_user
    @bookmarks = Bookmark.where(id: params.dig(:bookmark, :tag))
    return render_new if @bookmarks.empty?

    ActiveRecord::Base.transaction do
      @bookmarks.each do |bookmark|
        bookmark = Bookmark.new(manga: @manga, bookmark: bookmark)
        bookmark.save!
      end
      redirect_to manga_path(@manga.manga)
    end
  rescue ActiveRecord::RecordInvalid
    render_new
  end

  private

  def render_new
    @bookmark = Bookmark.new
    @bookmark.errors.add(:base, "You have already bookmarked it")
    render :new, status: :unprocessable_entity
  end
end
