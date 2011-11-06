class User < ActiveRecord::Base

  #serialize :roles
   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles  
    
  def is_admin?
    self.roles == "Admin"
  end
  
  def is_doctor?
    self.roles == "Doctor"
  end
  
  def is_patient?
    self.roles == "Patient"
  end
  
  def is_staff?
    self.roles == "Staff"
  end
  
  def is_company?
    self.roles == "Company"
  end
  
  
end
