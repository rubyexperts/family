class Patient < User

  has_many :appointments
  
  has_many :uploads
 # has_many :patient_images
  has_one :patient_image


end

