class TreatmentFormsController < ApplicationController

    before_filter :authenticate_user!
	before_filter :selected_tab
	
    def index
	end
	
	def new
	  @treatment_form = TreatmentForm.new
	end
	
	def create
	  raise params.inspect
	end   
	
	
	private

	def selected_tab
	  @select =  "doctor_patients"
	end


end
