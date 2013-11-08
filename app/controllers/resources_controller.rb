class ResourcesController < ApplicationController
  def index
    #category = params[:category]
    # @resources = Resource.where("category == #{category}")
    @resources = Resource.all
  end

  def new
    #render "new" template
      @resource_hash = Hash.new
      @resource_hash[:title] = params[:title]
      @resource_hash[:description] = params[:description]
      @resource_hash[:posted_by] = params[:posted_by]
      @resource_hash[:link] = params[:link]
  end

  def create
    if params[:resource][:title].nil? or params[:resource][:title].empty?
      flash[:notice] = "There is no title for this resource yet."
      redirect_to new_resource_path(params[:resource]) and return
    elsif params[:resource][:link].nil? or params[:resource][:link].empty?
        flash[:notice] = "There is no link for this resource yet."
        redirect_to new_resource_path(params[:resource]) and return
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
