class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def new
    #render "new" template
  end

  def create
    if params[:resource_title].nil?
      flash[:notice] = "There is no title for this resource yet."
      redirect_to new_resource_path and return
    elsif params[:resource_link].nil?
      flash[:notice] = "There is no link for this resource yet."
      redirect_to new_resource_path and return
    else
    @resource = Resource.create!(params[:resource])
    #redirect_to resource_path(@resource.id)
    redirect_to resources_path
    end
  end

  def show
    begin
    @resource = Resource.find(params[:id])
    rescue
      flash[:notice] = "This resource does not exist"
      redirect_to resources_path
    end
  end

  private
    def resource_params
      params.require(:resource).permit(:title, :description, :downloads)
    end

end
