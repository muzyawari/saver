class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  def index
    @folders = Folder.where(user: current_user)
    @create = Folder.new
    @sections = Section.where(folder: @folder)
    @tasks = {}
    @timers = {}
    @webs = {}
    @sections.each do |section|
      @tasks[section.id] = Task.where(section: section)
      @bookmarks[section.id] = Bookmark.where(section: section)
      @timers[section.id] = Timer.where(section: section)
      @webs[section.id] = Web.where(section: section)
    end
    @all_tasks = Task.all
    @notifications = current_user.notifications
    # Set the current month for the calender if there is a param -> take that value
    # if there is no params take today's date
    @date = params[:start_date].present? ? Date.parse(params["start_date"]) : Date.today
    current_month = @date.beginning_of_month..@date.end_of_month
    # Selects all the tasks for the current month
    # @tasks = current_user.tasks.where(date: current_month)
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
    @folders = Folder.where(user: current_user)
    @create = Folder.new
    @edit = Folder.friendly.find(params[:id])

    @sections = Section.where(folder: @folder)
    @section = @sections.first
    @task = Task.new
    @timer = Timer.new
    @web = Web.new
    @tasks = {}
    @timers = {}
    @webs = {}
    @sections.each do |section|
      @tasks[section.id] = Task.where(section: section)
      # @bookmarks[section.id] = Bookmark.where(section: section)
      @timers[section.id] = Timer.where(section: section)
      @webs[section.id] = Web.where(section: section)
    end
  end

  def new
    @folders = Folder.all
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    @user = current_user
    @folder.user = @user
    if @folder.save
      redirect_to folder_path(@folder)
    else
      render :new
    end
  end

  def edit
    @folder = Folder.friendly.find(params[:id])
  end

  def update
    @folder = Folder.friendly.find(params[:id])
    @folder.update(folder_params)
    redirect_to root_path
  end

  def destroy
    @folder.destroy
    redirect_to root_path
  end

  private

  def set_folder
    @folder = Folder.friendly.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name, :user_id)
  end
end
