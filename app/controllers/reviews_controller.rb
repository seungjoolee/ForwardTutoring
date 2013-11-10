class ReviewsController < ApplicationController
	def create
		@resource = Resource.find(params[:resource_id])
		@review = @resource.reviews.create(params[:review])
		redirect_to resources_path(@resource)
	end

end
