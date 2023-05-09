class MangasController < ApplicationController
  before_action :set_manga, only: [:show, :edit, :update, :destroy]

  # GET /mangas
  def index
    if params[:query].present?
      @mangas = Manga.search_by_manga_title_and_description(params[:query])
    else
      @mangas = Manga.all
    end

    respond_to do |format|
      format.html # default format, renders index.html.erb
      format.json { render json: @mangas } # renders JSON
    end
  end

  # GET /mangas/1
  def show
    @manga = Manga.find(params[:id])
    @chapters = @manga.chapters
  end

  # GET /mangas/new
  def new
    @manga = Manga.new
  end

  # GET /mangas/1/edit
  def edit
  end

  # POST /mangas
  def create
    @manga = Manga.new(manga_params)
    @manga.user_id = current_user.id

    if @manga.save!
      redirect_to @manga, notice: 'Manga was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mangas/1
  def update
    if @manga.update(manga_params)
      redirect_to @manga, notice: 'Manga was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mangas/1
  def destroy
    @manga.destroy
    redirect_to mangas_url, notice: 'Manga was successfully destroyed.'
  end

  def top
    @mangas = Manga.where(rating: 5)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manga
    @manga = Manga.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def manga_params
    params.require(:manga).permit(:manga_title, :description, :photo)
  end
end
