class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception


 #   def check_if_admin?()
	# if user.admin?
	# 	flash[:notice] = "Sorry. You are not allowed to perform this action."

	# 	return action, notice: "Sorry. You do not have the permission to verify a property."
	# end
 #  end

end
