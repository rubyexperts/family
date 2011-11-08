class UserDetail < ActiveRecord::Base

    belongs_to :user
	
	validates_presence_of :date_of_birth, :postal_address, :emergency_contact_name, :emergency_contact_relation,
	                      :emergency_contact_address, :emergency_contact_phone
	
end
