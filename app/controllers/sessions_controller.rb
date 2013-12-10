class SessionsController < ApplicationController
  def new
  end

  def create
    user = DrUser.authenticate(params[:session][:name], params[:session][:password])
    if user
      session[:user_uid] = user.uid
      redirect_to :subjects
    else
      flash[:notice] = "Invalid email or password"
      if params[:session][:name]
        flash[:name] = params[:session][:name]
      end
      render "new"
    end
  end

  def destroy
    session[:user_uid] = nil
    redirect_to root_url
  end
end
