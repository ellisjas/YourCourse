module SessionsHelper
	
	# COORDINATOR
	
	def log_in(user)
		session[:user_id] = user.id
	end
	
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end	
	
	def logged_in?
		!current_user.nil?
	end
	
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
	
	# ADMIN
	
	def log_in_admin(admin)
		session[:admin_id] = admin.id
	end
	
	def current_admin
		@current_admin ||= Admin.find_by(id: session[:admin_id])
	end		
	
	def admin_logged_in?
		!current_admin.nil?
	end
	
	def log_out_admin
		session.delete(:admin_id)
		@current_admin = nil
	end
	
end