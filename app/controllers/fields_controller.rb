class FieldsController < ApplicationController
  
  def show
    @field = Field.find(params[:id])
  end

end
