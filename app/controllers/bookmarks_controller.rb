class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark_list = BookmarkList.find(params[:bookmark_list_id])
    @bookmark.bookmark_list = @bookmark_list
    if @bookmark.save
      redirect_back fallback_location: folders_path, notice: 'Bookmark was successfully created'
    else
      redirect_back fallback_location: folders_path, alert: "Oops something went wrong"
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:name, :url)
  end

end
