class ResourcesController < ApplicationController
  def index
    if params[:topic].nil?
      @resources = Resource.all
    else
      topic = params[:topic]
      @resources = Resource.where("category == ?", topic)
    end
  end

  def new
    #render "new" template
    @resource_hash = Hash.new
    @resource_hash[:title] = params[:title]
    @resource_hash[:description] = params[:description]
    @resource_hash[:posted_by] = params[:posted_by]
    @resource_hash[:link] = params[:link]
    @topics = Topic.all(:include => :field)
    @grouped_options = @topics.inject({}) do |options, topic|
      (options[topic.field.title] ||= []) << [topic.title, topic.id]
      options
    end
    # @resource_hash[:category] = params[:category]

  end

  def create
    @topic = Topic.find(params[:resource][:topic_id])
    # @resource = Resource.new(params[:resource])
     @resource = @topic.resources.new(params[:resource])
    if !@resource.valid?
        flash[:notice] = @resource.errors.full_messages
        redirect_to new_resource_path(params[:resource]) and return
   else
      @resource.save!
     #  @topic.resources << @resource
      # redirect_to resource_path(@resource)
      redirect_to topic_path(@topic.id)
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
