class HomeController < ApplicationController

  before_filter :authenticate_user!
  layout 'default'

  def index
    if current_user.is_admin?
      redirect_to "/admin"
    elsif current_user.is_doctor?
      redirect_to "/doctors"
    elsif current_user.is_patient?
      redirect_to "/patients"
    elsif current_user.is_staff?
      redirect_to "/staff"
    elsif current_user.is_company?
      redirect_to "/company"
    end   
  end
  
  def admin
  end
  
  def doctors
  end
  
  def patients
  end
  
  def staff
  end
  
  def company
  end
   

end
