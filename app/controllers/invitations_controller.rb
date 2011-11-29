class InvitationsController < ApplicationController
   
   before_filter :authenticate_user!
   layout 'admin'
  
   def new
   end

   def create     
     user_type = params[:z]
     email_addresses = params[:q].split(',')
     email_addresses.each do |email|
       puts email.inspect
       UserMailer.welcome_invitation(email, user_type).deliver
     end
     redirect_to "/clinics"     
   end

end
