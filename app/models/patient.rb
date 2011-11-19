class Patient < User

  has_many :appointments
  has_many :patient_images
  
  has_many :doctor_patients
  has_many :doctors, :through => :doctor_patients,  :source => :doctor
  
  has_one :treatment_form

  
end 