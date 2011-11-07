class PatientsController < ApplicationController


   def index
     @patients = Patient.find(:all)
   end
   
   def new
     @patient = Patient.new
   end
   
   def create
     raise params.inspect
   end
   
   def edit
   end
   
   def update
   end
   
   
end
