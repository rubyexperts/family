class UsersController < ApplicationController

   before_filter :authenticate_user!
   before_filter :selected_tab
   layout 'default'   
   
   def index
   end
   
   def new
     @user = User.new
   end
   
   def create_master_account
     @user = User.new(params[:user])
     if @user.valid?
        @user.master_id = current_user.id
        @user.save
        redirect_to '/doctors'
     else
       render :new
     end
   end
   
   private
   
   def selected_tab
     @select = "admin"
   end

  
end
