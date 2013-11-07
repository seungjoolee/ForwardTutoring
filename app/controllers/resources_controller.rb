class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def new
    #render "new" template
  end

  def create
    @resource = Resource.create!(params[:resource])
    #redirect_to resource_path(@resource.id)
    redirect_to resources_path
  end

  def show
    @resource = Resource.find(params[:id])
  end

  private
    def resource_params
      params.require(:resource).permit(:title, :description, :downloads)
    end

end
