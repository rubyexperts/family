class DoctorsController < ApplicationController

    before_filter :authenticate_user!
    before_filter :selected_tab

    def index
	  end
	   # edit account of doctors
    def edit
       @user = User.find(params[:id])
    end

    def update
     @user = User.find(params[:id])
     @user.attributes = params[:doctor]
     @user_detail = UserDetail.new(params[:user_detail])
     if @user.valid? && @user_detail.valid?
        @user_detail.user_id = @user.id
        @user.save && @user_detail.save
        redirect_to :action => "index"
     else
       render :edit
     end
    end
	def doctor_patients
	  @select = "doctor_patients"
	  @my_patients = DoctorPatient.where('doctor_id= ?', current_user.id)
	end
	
    private
	
    def selected_tab
	  @select =  "home"
    end
	
	
end
