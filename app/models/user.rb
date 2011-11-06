class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable #, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :type, :password, :password_confirmation, :remember_me
  
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

  def is_company?
  self.type == "Company"
  end

  
end