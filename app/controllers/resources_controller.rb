class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def create
    @resource = Resource.new(resource_params)
   
    @resource.save
    redirect_to @resource
  end

  def show
    @resource = Resource.find(params[:id])
  end
   
  private
    def resource_params
      params.require(:resource).permit(:title, :description, :downloads)
    end

end
