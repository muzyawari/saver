class SectionsController < ApplicationController
  before_action :set_section, only: [:update, :destroy]

  def new
    @folder = Folder.find(params[:folder_id])
    @section = Section.new(section_params)
  end

  def create
    @folder = Folder.friendly.find(params[:folder_id])
    @section = Section.new(section_params)
    @section.folder = @folder
    if @section.save
      redirect_back fallback_location: root_path
    else
      render :new
    end
  end

  def update
    @section = Section.find(params[:id])
    @folder = Folder.find(@section.folder_id)
    @section.update(section_params)
    if @section.save
      redirect_back fallback_location: root_path
    else
      render :new
    end
  end

  def destroy
    @folder = Folder.find(@section.folder_id)
    @section.destroy
    redirect_back fallback_location: root_path
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:section_type, :position, :visible, :name)
  end
end
