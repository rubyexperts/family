class UsersController < ApplicationController

   before_filter :authenticate_user!
   layout 'default'
      
   
   def index
   end
 
  
end
