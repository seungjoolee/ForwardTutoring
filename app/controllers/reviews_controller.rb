class ReviewsController < ApplicationController
  def create
    @resource = Resource.find(params[:resource_id])
    @review = @resource.reviews.new(params[:review])
    if !@review.valid?
        flash[:notice] = @review.errors.full_messages
          redirect_to resource_path(@resource) and return
    else
      # @resource = Resource.find(params[:resource_id])
      # @review = @resource.reviews.create(params[:review])
      @review.save!
    redirect_to resource_path(@resource)
    end
  end

end
