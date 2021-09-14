class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
  end

  def destroy
    # @notification = Notification.find(params[:id])
    @task = Notification.find(params[:id]).params[:task]
    @section = Section.find(@task.section_id)
    @folder = Folder.find(@section.folder_id)
    # @notification.destroy
    Notification.destroy_all
    redirect_to @folder
  end

  # def destroy_all
  #   Notification.destroy_all
  # end
end
