class ResourcesController < ApplicationController
  ##Useless. Remove tests when this ASAP
  def index
    redirect_to(subjects_path)
    #if params[:search_text].nil? or params[:search_text].empty?
    #  @resources = Resource.all
    #else
    #  @resources = Resource.where("title == ?", params[:search_text])
    #end
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
    @resource_hash[:topic_id] = params[:topic_id]
    # @resource_hash[:category] = params[:category]

  end

  def create
    topic_id = params[:resource][:topic_id]
    if topic_id.blank?
      flash[:notice] = ["Topic should not be blank"]
      redirect_to new_resource_path(params[:resource]) and return
    end
    @topic = Topic.find(params[:resource][:topic_id])
    # @resource = Resource.new(params[:resource])
     @resource = @topic.resources.new(params[:resource])
    if !@resource.valid?
      flash[:notice] = @resource.errors.full_messages
        redirect_to new_resource_path(params[:resource]) and return
   else
      @resource.save!
     #  @topic.resources << @resource
      redirect_to resource_path(@resource)
      #redirect_to topic_path(@topic.id)
    end
  end

  def edit
    @resource_hash = Hash.new
    begin
      @resource = Resource.find(params[:id])
      @resource_hash[:title] = @resource.title
      @resource_hash[:description] = @resource.description
      @resource_hash[:posted_by] = @resource.posted_by
      @resource_hash[:link] = @resource.link
      @resource_hash[:topic_id] = @resource.topic_id
      @topics = Topic.all(:include => :field)
      @grouped_options = @topics.inject({}) do |options, topic|
        (options[topic.field.title] ||= []) << [topic.title, topic.id]
        options
      end
    rescue
      flash[:notice] = "This resource does not exist"
      redirect_to subjects_path
    end
    end

  def update
    @resource = Resource.find params[:id]
    begin
    @resource.update_attributes!(params[:resource])
    flash[:notice] = ["#{@resource.title} was successfully updated."]
    redirect_to resource_path(@resource) and return
    rescue
      flash[:notice] = @resource.errors.full_messages
      redirect_to edit_resource_path(params[:resource]) and return
    end
  end


  def show
    begin
    @resource = Resource.find(params[:id])
    rescue
      flash[:notice] = "This resource does not exist"
      redirect_to subjects_path
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to subjects_path
  end

  private
    def resource_params
      params.require(:resource).permit(:title, :description, :downloads)
    end

end
