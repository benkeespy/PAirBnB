class UsersController < Clearance::UsersController
	if respond_to?(:before_action)
	   before_action :redirect_signed_in_users, only: [:create, :new]
	   skip_before_action :require_login, only: [:create, :new], raise: false
	   skip_before_action :authorize, only: [:create, :new], raise: false
	 else
	   before_filter :redirect_signed_in_users, only: [:create, :new]
	   skip_before_filter :require_login, only: [:create, :new], raise: false
	   skip_before_filter :authorize, only: [:create, :new], raise: false
	 end

	 def new
	   @user = User.new
	   render template: "users/new"
	 end

	 def edit
	 end
	 	
	 end

	 def create
	   @user = user_from_params

	   if @user.save
	     sign_in @user
	     # redirect_to #listing page
	     render "welcome/index" # temporaly
	   else
	     render template: "users/new"
	   end
	 end

	 private

	 def avoid_sign_in
	   warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
	     "deprecated. Use `redirect_signed_in_users` instead. " +
	     "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
	     " or `skip_before_action :avoid_sign_in` as well"
	   redirect_signed_in_users
	 end

	 def redirect_signed_in_users
	   if signed_in?
	     redirect_to Clearance.configuration.redirect_url
	   end
	 end

	 def url_after_create
	   Clearance.configuration.redirect_url
	 end

	 def user_from_params
	 	User.new(params.require(:user).permit(:email, :password, :name, :gender, :age))
	 end
end
