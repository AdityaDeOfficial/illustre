class ChapterReviewsController < ApplicationController
  before_action :set_chapter

  def new
    @chapter_review = Chapter_review.new
  end

  def create
    @chapter_review = Chapter_review.new(chapter_review_params)
    @chapter_review.chatper = @chatper
    if @chapter_review.save
      redirect_to manga_chapter_path(@chapter)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  def chapter_review_params
    params.require(:chapter_review).permit(:comment, :rating)
  end
end
