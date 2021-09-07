class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @section = Section.find(params[:section_id])
  end

  def create
    @section = Section.find(params[:section_id])
    @folder = Folder.find(@section.folder_id)
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.section = @section
    if @bookmark.save
      redirect_to @folder
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @section = Section.find(@bookmark.section_id)
    @folder = Folder.find(@section.folder_id)
    @bookmark.destroy
    redirect_to @folder
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:name, :url, :section_id, :position)
  end
end
