class ChaptersController < ApplicationController
  # retrive all chapters
  def index
    @chapters = Chapter.all
  end
  # retrieve chapters based on an id
  def show
    #@chapter = Chapter.find(params[:id])
  end
  # create new instance of chapter
  def new
    @chapter = Chapter.new
  end
  # recieve new instance of chapter model
  def create
    @chapter = Chapter.new(chapter_params)
    # handles simple form submission
    @chapter.manga_id = params[:manga_id]
    # create the new chapter & save to DB
    if @chapter.save
      redirect_to @chapter
    else
      render 'new'
    end
  end
  # retrieve chapter by it's ID, render to edit form
  def edit
    @chapter = Chapter.find(params[:id])
  end
  # recieve data from edit action
  def update
    @chapter = Chapter.find(params[:id])
    # update chapter by it's ID, save to db
    if @chapter.update(chapter_params)
      redirect_to @chapter
    else
      render 'edit'
    end
  end
  # delete chapter by it's ID
  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy

    redirect_to chapters_path
  end
  # protect from attacks with _params
  private
    def chapter_params
      params.require(:chapter).permit(:chapter_title, :chapter_number, :pdf_upload, :manga_id)
    end
end
