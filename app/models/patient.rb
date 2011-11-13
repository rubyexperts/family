class Patient < User
  has_many :appointments
  has_one :patient_image
end

