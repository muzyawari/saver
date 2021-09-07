class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  def index
    @folders = Folder.all
  end

  def show
    @folders = Folder.all
    @folder = Folder.find(params[:id])
    @sections = Section.where(folder: @folder)
    @tasks = {}
    @bookmarks = {}
    @timers = {}
    @sections.each do |section|
      @tasks[section.id] = Task.where(section: section)
      @bookmarks[section.id] = Bookmark.where(section: section)
      @timers[section.id] = Timer.where(section: section)
    end
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    @user = current_user
    @folder.user = @user
    if @folder.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @folder = Folder.find(params[:id])
  end

  def update
    @folder = Folder.find(params[:id])
    @folder.update(folder_params)
    redirect_to root_path
  end

  def destroy
    @folder.destroy
    redirect_to root_path
  end

  private

  def set_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name, :user_id)
  end
end
