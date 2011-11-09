class Appointment < ActiveRecord::Base
  validates :doctor_id ,:patient_id , :hosiptal_name , :purpose , :presence => true
  belongs_to :patient , :foreign_key => :patient_id
  belongs_to :doctor , :foreign_key => :doctor_id

end
