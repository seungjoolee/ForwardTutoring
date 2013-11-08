class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def new
    #render "new" template
    if params[:resource].nil?
      @resource_hash = Hash.new
    else
      @resource_hash[:title] = params[:resource_title]
      @resource_hash[:description] = params[:resource_description]
      @resource_hash[:posted_by] = params[:resource_posted_by]
    end
  end

  def create
    #if params[:resource_title].nil? or params[:resource_title].empty?
    #  flash[:notice] = "There is no title for this resource yet."
      # @resource_hash = {title: params[:resource_title], :posted_by => params[:resource_posted_by], description: params[:resource_description]}
     # redirect_to new_resource_path(params[:resource]) and return
    #elsif params[:resource_link].nil?
    #  flash[:notice] = "There is no link for this resource yet."
       # @resource_hash = {title: params[:resource_title], posted_by: params[:resource_posted_by], description: params[:resource_description]}
    #  redirect_to new_resource_path(params[:resource]) and return
   # else
    @resource = Resource.create!(params[:resource])
    #redirect_to resource_path(@resource.id)
    redirect_to resources_path
   # end
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
