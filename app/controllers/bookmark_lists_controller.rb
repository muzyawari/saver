class BookmarkListsController < ApplicationController
  def index
    @bookmarks = BookmarkList.all
    raise
  end

  def show
    # @bookmark = Bookmark.find(params[:id])
    @create = Folder.new
    @folders = Folder.where(user: current_user)
    # @sections = Section.where(folder: @folder)
    @bookmark = Bookmark.new
    @bookmark_list = BookmarkList.find(params[:id])
    if Chatroom.all.count > 0
      @chatroom = Chatroom.find(1)
      @message = Message.new
    end
  end

  def new
    @bookmark = BookmarkList.new
  end

  def create
    @bookmark = BookmarkList.new(bookmark_params)
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to folders_path
    else
      render :new
    end
  end

  def destroy
    @bookmark = BookmarkList.find(params[:id])
    @bookmark.destroy
    redirect_to root_path
  end

  private

  def bookmark_params
    params.require(:bookmark_list).permit(:name)
  end
end
