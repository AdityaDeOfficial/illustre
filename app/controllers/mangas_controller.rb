class MangasController < ApplicationController
  def new
    @manga = Manga.new
  end

  def create
    @manga = Manga.new(manga_params)
    @manga.user_id = current_user.id
    if @manga.save
      redirect_to @manga, notice: 'Manga was successfully created.'
    else
      render :new
    end
  end

  def top
    @mangas = Manga.where(rating: 5)
  end

  private

  def manga_params
    params.require(:manga).permit(:title, :description, :user_id, :cover_image)
  end
end
