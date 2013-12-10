class SessionsController < ApplicationController
  def new
  end

  def create
  	user = DrUser.authenticate(params[:name], params[:pass])
  	if user
  		session[:user_uid] = user.uid
  		redirect_to :subjects
  	else
  		flash.now.alert = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_uid] = nil
  	redirect_to root_url
  end
end
