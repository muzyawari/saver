class WebsController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @web = Web.new
  end

  def create
    @section = Section.find(params[:section_id])
    @folder = Folder.find(@section.folder_id)
    @web = Web.new(web_params)
    @web.section = @section
    if @web.save
      redirect_to folder_path(@folder)
    else
      render :new
    end
  end

  def destroy
    @web = Web.find(params[:id])
    @section = Section.find(@web.section_id)
    @folder = Folder.find(@section.folder_id)
    @web.destroy
    redirect_back fallback_location: root_path
    # redirect_to @folder
  end

  private

  def web_params
    params.require(:web).permit(:url, :height, :width)
  end
end
