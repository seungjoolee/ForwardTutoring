class SubjectsController < ApplicationController
  def index
    #@subjects = Subject.all
  end
  
  def new
    #render "new" template
  end
  
  def create
    #@subject = Subject.create!(params[:resource])
   
    redirect_to subjects_path
  end

  def show
    #@resource = Resource.find(params[:id])
  end
   
end
