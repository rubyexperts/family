class PatientsController < ApplicationController

   before_filter :authenticate_user!
   layout 'default'

   def index
     if current_user.is_complete?
       puts "-----------".inspect
     else
       redirect_to "/patients/#{current_user.id}/edit"
     end
   end
   
   def edit
     @user = User.find(params[:id])
   end
   
   def update     
     @user = User.find(params[:id])
     if @user.update_attributes(params[:patient])
        puts "------------".inspect
     else
       render :edit
     end
   end
   
      
   
end
