class InvitationsController < ApplicationController
   
   before_filter :authenticate_user!, :only => [:new]
   skip_before_filter :authenticate_user!, :only => [:send_invitation]
  
   def new
     render :layout => 'admin'
   end

   def create
     user_type = params[:z]
     email_addresses = params[:q].split(',')
     email_addresses.each do |email|
       puts email.inspect
       UserMailer.welcome_invitation(email, user_type).deliver
     end
     if user_signed_in?
       flash[:notice] = "The Invitation has been sent. Please check the mail to see it"
       redirect_to "/clinics", :layout => 'admin'
     else
       flash[:notice] = "The Invitation has been sent. Please check the mail to see it"
       redirect_to "/users/sign_in", :layout => 'login' 
     end
   end   
   
   def send_invitation
     render :layout => 'login'
   end
   

end