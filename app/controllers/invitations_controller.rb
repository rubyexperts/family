class InvitationsController < ApplicationController
   
   before_filter :authenticate_user!, :only => [:new, :sending_invitation, :creating_invitation]
   skip_before_filter :authenticate_user!, :only => [:send_invitation, :sign_up_user, :create_user]
  
   # This is from Admin Layout
   def new
     render :layout => 'admin'
   end
   
   # This is from Login Page irrelevant to domain & Subdomain   
   def send_invitation
     render :layout => 'login'
   end

   # This is common for creating invitation from login page & admin page
   def create
     email_addresses = params[:q].split(',')
     email_addresses.each do |email|
       UserMailer.welcome_invitation(email, @current_site).deliver
     end
     if user_signed_in?
       flash[:notice] = "The Invitation has been sent. Please check the mail to see it"
       redirect_to "/clinics", :layout => 'admin'
     else
       flash[:notice] = "The Invitation has been sent. Please check the mail to see it"
       redirect_to "/users/sign_in", :layout => 'login' 
     end
   end   
   
   # With Login from Default Layout   
   def sending_invitation
      render :layout => 'default'
   end
   
   def creating_invitation
     email_addresses = params[:q].split(',')
     email_addresses.each do |email|
       UserMailer.welcome_invitation(email, @current_site).deliver
     end
     redirect_to "/doctors", :layout => 'default'
   end
  
   # Registering Users
   def sign_up_user
     session[:user_params] ||= {}
     @user = User.new(session[:user_params])
     @user.current_step = session[:user_basic] 
     render :layout => 'login'
   end
   
   def create_user
     session[:user_params].deep_merge!(params[:user]) if params[:user] 
     @user = User.new(session[:user_params])
     @user.current_step = session[:user_basic]
     if @user.valid?
       if params[:previous_button]
         @user.get_previous_step(params[:type])
       elsif @user.last_step?
         @user_detail = UserDetail.new(params[:user_detail])
         if @user.valid? && @user_detail.valid?
            raise params.inspect
            @user.site_id = @current_site
            @user.save
            @user_detail.user_id = @user
            @user_detail.save
         end
       else
         @user.get_next_step(params[:type])
       end
       session[:user_basic] = @user.current_step
     end
     if @user.new_record?
       render 'sign_up_user', :layout => 'login'
     else
       session[:user_basic] = session[:user_params] = nil
       flash[:notice] = "User saved."
       redirect_to "/home", :layout => 'default'
     end
   end
   
   

end