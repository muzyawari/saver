class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @section = Section.find(params[:section_id])
  end

  def create
    @section = Section.find(params[:section_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.section = @section
    if @bookmark.save
      redirect_to folders_path
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:name, :section_id, :position)
  end
end
