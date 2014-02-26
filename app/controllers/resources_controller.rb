class ResourcesController < ApplicationController

before_filter :check_for_cancel, :only => [:create, :update]
before_filter :require_login, :only => [:new, :edit, :update]

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to subjects_path
    end
  end

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
      if not topic.nil? and not topic.field.nil? and not options.nil? and not topic.field.title.nil?
        if not options[topic.field.title]
          options[topic.field.title] = []
        end
        options[topic.field.title] << [topic.title, topic.id]
      	#(options[topic.field.title] ||= []) << [topic.title, topic.id]
      	options
      end
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
    params[:resource][:dr_user_id] = current_user.uid
     @resource = @topic.resources.new(params[:resource])
    if !@resource.valid? && is_tutor
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
      # @resource_hash[:posted_by] = @resource.posted_by
      @resource_hash[:link] = @resource.link
      @resource_hash[:pdf_file_name] = @resource.pdf_file_name
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
      if params[:is_file] == "true"
        is_file = true
      else
        is_file = false
      end
      @resource.attributes = params[:resource]
      if is_file
        @resource.attributes = {link: ""}
      else
        @resource.pdf.clear
      end
      @resource.save

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
    @dr_user = DrUser.where(:uid => @resource.dr_user_id).first



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

  def resource_params
    params.require(:resource).permit(:title, :description, :downloads)
  end

  def require_login
    redirect_to log_in_url unless is_tutor
  end

  private :resource_params, :require_login

end
