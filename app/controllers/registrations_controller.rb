class RegistrationsController < Devise::RegistrationsController
  prepend_view_path "app/views/devise"
  layout 'login'
	 
    def new
	   super
	 end
	 
	 def create
	   @user = User.new(params[:user])
       if @user.save
	      flash[:notice] = "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."
	      redirect_to "/home"
	   else
	      render :action => :new
	   end
	 end
	 
	 def update
	   super
	 end
	 
end
