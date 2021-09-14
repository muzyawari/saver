class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  def index
    @folders = Folder.all
    @create = Folder.new
    @sections = Section.where(folder: @folder)
    @tasks = {}
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
    @timers = {}
    @sections.each do |section|
      @tasks[section.id] = Task.where(section: section)
      @bookmarks[section.id] = Bookmark.where(section: section)
      @timers[section.id] = Timer.where(section: section)
    end
    @all_tasks = Task.all
    # @chatroom = Chatroom.find(1)

    # @folder for the sidebars
    #
    @notifications = current_user.notifications

  

    # Selects all the folder for the current_user
    @folders = Folder.where(user: current_user)

    # Set the current month for the calender if there is a param -> take that value
    # if there is no params take today's date
    @date = params[:start_date].present? ? Date.parse(params["start_date"]) : Date.today
    current_month = @date.beginning_of_month..@date.end_of_month

    # Selects all the tasks for the current month
    @tasks = current_user.tasks.where(date: current_month)

    # @all_tasks = Task.all
    # @data = Task.group(:completed).count

    if Chatroom.all.count > 0
      @chatroom = Chatroom.find(1)
      @message = Message.new
    end

  end

  def show
    if Chatroom.all.count > 0
      @chatroom = Chatroom.find(1)
      @message = Message.new
    end
    @notifications = current_user.notifications
    @q = Task.ransack(params[:q])
    @results = @q.result(distinct: true)
    @folders = Folder.all
    @create = Folder.new
    @edit = Folder.find(params[:id])

    @sections = Section.where(folder: @folder)
    @section = @sections.first
    @tasks = {}
    @task = Task.new
    @timer = Timer.new
    @bookmarks = {}
    @timers = {}
    @sections.each do |section|
      @tasks[section.id] = Task.where(section: section)
      @bookmarks[section.id] = Bookmark.where(section: section)
      @timers[section.id] = Timer.where(section: section)
    end
  end

  def new
    @folders = Folder.all
    @folder = Folder.new
  end

  def create
    @create = Folder.new(folder_params)
    @user = current_user
    @create.user = @user
    if @create.save
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
