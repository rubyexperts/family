class UserMailer < ActionMailer::Base

   default :from => "no-reply@familypractice.com"
   
   # sending email to doctor for appointment confirmation
   def appointment_pending(appoint_obj)
      @doctor = Doctor.find_by_id(appoint_obj.doctor_id)
      @patient = Patient.find_by_id(appoint_obj.patient_id)
      mail(:to => @doctor.email, :subject => "New Appointment")
   end
   
   # sending email to patient after doctor is approved
   def appointment_confirmation(appoint_obj)
      @doctor = Doctor.find_by_id(appoint_obj.doctor_id)
      @patient = Patient.find_by_id(appoint_obj.patient_id)
      mail(:to => @patient.email, :subject => "Appointment Approved")
   end
  
  def welcome_email(name)
    mail(:to => name[:email], :subject=> "You are Invited as #{name[:type]}")
  end
  
  def welcome_invitation(email, type)
    @email = email
    @type = type
    mail(:to => @email, :subject => "You are Invited as #{@type}")
  end
  
  def invitation_email(email, current_site)
    @email = email
    @current_site = current_site
    mail(:to => @email, :subject => "You have a Invitation")
  end 
  
end
