class User < ActiveRecord::Base
   
  belongs_to :site

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :type, :password, :password_confirmation, :remember_me, :first_name, :last_name,
                  :title, :address, :home_number, :office_number, :mobile_number, :country, :city, :zipcode
  
  has_one :user_detail
  has_many :uploads
  
  validates_presence_of :first_name, :if => :first_name
  validates_presence_of :last_name, :if => :last_name
  validates_presence_of :title, :if => :title
  validates_presence_of :address, :if => :address
  validates_presence_of :home_number, :if => :home_number
  
  validates_uniqueness_of :email, :scope => :site_id, :case_sensitive => false 
  
  # authentication based on subdomain
  def self.find_for_authentication(conditions={})
     site = Site.where('name = ?', conditions[:subdomain]).first
     self.find_by_email_and_site_id(conditions[:email], site.id)
  end

  def name
    first_name + " " + last_name
  end
  
  def is_admin?
    self.type == "Admin"
  end

  def is_doctor?
    self.type == "Doctor"
  end

  def is_patient?
    self.type == "Patient"
  end

  def is_staff?
    self.type == "Staff"
  end

  def is_nurse?
    self.type == "Nurse"
  end
  
  def is_company?
    self.type == "Company"
  end
  
  def is_account_user?
    self.type == "AccountUser"
  end
  
  def is_complete?
    if (  ( ( (!self.first_name.nil? && !self.last_name.nil?) && (!self.title.nil? && !self.user_detail.date_of_birth.nil?) ) && ( (!self.address.nil? && !self.user_detail.postal_address.nil?) && ( !self.home_number.nil? && !self.user_detail.emergency_contact_name.nil?) )    ) && (  ( (!self.user_detail.emergency_contact_relation.nil? && !self.user_detail.emergency_contact_address.nil?)     && !self.user_detail.emergency_contact_phone.nil? )        )      )
      true
    else
      false
    end
  end

  
end