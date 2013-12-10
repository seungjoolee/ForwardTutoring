class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :is_tutor, :is_admin

  private

  def current_user
  	@current_user ||= DrUser.find(session[:user_uid]) if session[:user_uid]
  end

	def is_tutor
		tutor_row = DrUsersRole.where(:uid => session[:user_uid], :rid => 5)
		special_tutor_row = DrUsersRole.where(:uid => session[:user_uid], :rid => 7)
		admin_row = DrUsersRole.where(:uid => session[:user_uid], :rid => 3)
		if not tutor_row.empty? or not special_tutor_row.empty? or not admin_row.empty?
			@is_tutor = true
		else
			@is_tutor = false
		end
		return @is_tutor
	end

	def is_admin
		admin_row = DrUsersRole.where(:uid => session[:user_uid], :rid => 3)
		return !admin_row.empty?
	end

end
