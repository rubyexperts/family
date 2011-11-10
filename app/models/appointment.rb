class Appointment < ActiveRecord::Base
  validates :doctor_id , :hosiptal_name , :purpose , :presence => true
  belongs_to :patient , :foreign_key => :patient_id
  belongs_to :doctor , :foreign_key => :doctor_id
  validates :start_time, :presence => { :message => "must be a valid date/time" }
  validates :end_time, :presence => {:message => "must be a valid date/time"}
  validate :start_must_be_before_end_time

  def start_must_be_before_end_time
  valid = start_time && end_time && start_time < end_time
  errors.add(:start_time, "must be before end time") unless valid
 end

end
