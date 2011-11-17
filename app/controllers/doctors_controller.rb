class DoctorsController < ApplicationController

    before_filter :authenticate_user!
    before_filter :selected_tab

    def index
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
