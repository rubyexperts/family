class UserMailer < ActionMailer::Base

   default :from => "no-reply@familypractice.com"
   
   # sending email to doctor for appointment confirmation
   def appointment_confirm(appoint_obj)
      @doctor = Doctor.find_by_id(appoint_obj.doctor_id)
      @patient = Patient.find_by_id(appoint_obj.patient_id)
      mail(:to => @doctor.email, :subject => "New Appointment")
   end
  
  
end
