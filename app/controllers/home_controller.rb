class HomeController < ApplicationController


  before_filter :authenticate_user!
  layout 'default'

  def index
     puts "-----------------"
     puts current_user.inspect
     puts "-----------------"
  end
  
  

end
