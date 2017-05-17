module AdminSessionsHelper
  
  def log_in_admin(admin)
		admin_session[:admin_id] = admin.id
	end
	
	def current_admin
		@current_admin ||= Admin.find_by(id: admin_session[:admin_id])
	end		
	
	def admin_logged_in?
		!current_admin.nil?
	end
	
	def log_out_admin
		admin_session.delete(:admin_id)
		@current_admin = nil
	end
  
end
