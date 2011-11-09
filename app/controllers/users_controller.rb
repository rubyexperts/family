class UsersController < ApplicationController

   before_filter :authenticate_user!
   layout 'default'      
   
   def index
   end
   
   def new
     @user = User.new
   end

   def create
   end
 
  
end
