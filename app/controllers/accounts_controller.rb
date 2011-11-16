class AccountsController < ApplicationController

   before_filter :authenticate_user!
   before_filter :selected_tab

   def index
      
   end 
   
   def new
     @user = User.new
   end
   
   def create
	 @user = User.new(params[:user])
	 if @user.valid?
	   redirect_to "/accounts"
	 else
	   render :action => :new
	 end
   end
   

   private
   
   def selected_tab
     @select = "accounts"
   end
  
  
  
end
