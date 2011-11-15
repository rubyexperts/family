class DoctorsController < ApplicationController

    before_filter :authenticate_user!
    before_filter :selected_tab

    def index
	  @my_approved_appointments = Appointment.where('doctor_id = ? and approve_status = ?', current_user.id, 2)
	  
	  puts "-------------------------"
	  puts @my_approved_appointments.inspect
	  puts "-------------------------"
	  
	  @my_patients = []
	  @my_approved_appointments.each do |appointment|
	     @my_patients << Patient.find_by_id(appointment.patient_id)
	  end
	  
	  puts "-------------------------"
	  puts @my_patients.inspect
	  puts "-------------------------"
	  
	end
	
	
	
    private

    def selected_tab
	  @select =  "home"
    end
	
	
end
