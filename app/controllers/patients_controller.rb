class PatientsController < ApplicationController

   before_filter :authenticate_user!
   layout 'default'
   before_filter :selected_tab

   def index
     #if current_user.is_complete?
       @patients = Patient.find :all       
     #else
       #redirect_to "/patients/#{current_user.id}/edit"
     #end
   end
   
   def edit
     @user = User.find(params[:id])
   end
   
   def update
     @user = User.find(params[:id])
     @user.attributes = params[:patient]
     @user_detail = UserDetail.new(params[:user_detail])
     if @user.valid? && @user_detail.valid?
        @user_detail.user_id = @user.id
        @user.save && @user_detail.save
        redirect_to :action => "index"
     else
       render :edit
     end
   end
   
   
   private
   
   def selected_tab
      @select = "home"
   end
   
      
   
end
