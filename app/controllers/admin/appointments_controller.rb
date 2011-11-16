class Admin::AppointmentsController < ApplicationController
  def index
    @appointments =  Appointment.all
    @select = "/admin/appointments"
  end

  def create
  end

  def update
  end

  def new
    @appointment = Appointment.new
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @appointment }
#    end
  end

  def destroy
  end

end
