class TimersController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @timer = Timer.new
  end

  def create
    @section = Section.find(params[:section_id])
    @folder = Folder.find(@section.folder_id)
    @timer = Timer.new(timer_params)
    @timer.section = @section
    if @timer.save
      redirect_to folder_path(@folder)
    else
      render :new
    end
  end

  def destroy
    @timer = Timer.find(params[:id])
    @section = Section.find(@timer.section_id)
    @folder = Folder.find(@section.folder_id)
    @timer.destroy
    redirect_to @folder
  end

  private

  def timer_params
    params.require(:timer).permit(:name)
  end
end
