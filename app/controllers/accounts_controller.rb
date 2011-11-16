class AccountsController < ApplicationController

   before_filter :authenticate_user!
   before_filter :selected_tab, :only => [:all_accounts]

   def index
     @select = "home"
   end
   
   def all_accounts
     @users = User.where('master_id = ?', current_user.id)
   end
   
   def new
     @user = User.new
   end
   
   def create
	  @user = User.new(params[:user])
	  if @user.valid?
       @user.master_id = current_user.id
       @user.save
	    redirect_to "/accounts"
	  else
	    render :action => :new
	  end
   end
   
   def edit
     @user = User.find(params[:id])
   end
   
   def update    
     @user = User.find(params[:id])
     if @user.update_attributes(params[:user])
       redirect_to "/accounts"
     else
       render :edit
     end
   end
   
   def destroy
     @user = User.find(params[:id])
     @user.destroy
     redirect_to "/accounts"
   end 

   private
   
   def selected_tab
     @select = "accounts"
   end
  
  
  
end
