class ApplicationController < ActionController::Base
   
   protect_from_forgery
 
   layout 'login'
  
   def after_sign_out_path_for(resource_or_scope)
      '/users/sign_in'
   end
  
end
