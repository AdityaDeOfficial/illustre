class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def show
  end

  def destroy
    @bookmark.destroy
    redirect_to user_path, notice: 'UnBookmarked'
  end

  private

  def set_bookmark
    @user = User.find(params[:id])
  end
end
