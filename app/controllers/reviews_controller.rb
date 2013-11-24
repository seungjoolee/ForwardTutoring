class ReviewsController < ApplicationController
  def create
    @resource = Resource.find(params[:resource_id])
    @review = @resource.reviews.new(params[:review])
    if !@review.valid?
        flash[:notice] = @review.errors.full_messages
        flash[:review_user] = @review.user
        flash[:review_content] = @review.content
        flash[:review_rating] = @review.rating
        flash[:review_anonymous] = @review.anonymous
        redirect_to resource_path(@resource)+"#add-review" and return
    else
      # @resource = Resource.find(params[:resource_id])
      # @review = @resource.reviews.create(params[:review])
      @review.save!
    redirect_to resource_path(@resource) + "#review-" + @review.id.to_s
    end
  end

end
