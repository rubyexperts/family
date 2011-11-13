class Patient < User

  has_many :appointments
  has_many :patient_images

end