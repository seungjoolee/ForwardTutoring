class ResourcesController < ApplicationController
  def index
    if params[:category].nil?
      @resources = Resource.all
    else
      category = params[:category]
      @resources = Resource.where("category == #{category}")
    end
  end

  def new
    #render "new" template
    @resource_hash = Hash.new
    @resource_hash[:title] = params[:title]
    @resource_hash[:description] = params[:description]
    @resource_hash[:posted_by] = params[:posted_by]
    @resource_hash[:link] = params[:link]
    @resource_hash[:category] = params[:category]

  end

  def create
    @resource = Resource.new(params[:resource])
    if !@resource.valid?
        flash[:notice] = @resource.errors.full_messages
        redirect_to new_resource_path(params[:resource]) and return
   else
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
