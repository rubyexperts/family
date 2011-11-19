class DoctorsController < ApplicationController

    before_filter :authenticate_user!
    before_filter :selected_tab

    def index
      #flash[:notice]=" Logged in successfully"
	  end
	   # edit account of doctors
    def edit
       @user = User.find(params[:id])
    end

    def update
     @user = User.find(params[:id])
     @user.attributes = params[:doctor]
     @doctor_detail = DoctorDetail.new(params[:doctor_detail])
     if @user.valid? && @doctor_detail.valid?
        @doctor_detail.user_id = @user.id
        @user.save && @doctor_detail.save
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
