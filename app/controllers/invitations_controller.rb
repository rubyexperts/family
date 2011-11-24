class InvitationsController < ApplicationController
   
   # before_filter :authenticate_user!
   # prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  #include Devise::Controllers::InternalHelpers
  skip_before_filter :authenticate_user!
  layout 'default'
  

  def new
   @invitation=params[:invitation]
  end

  def create
    @invitation=params[:invitation]
    UserMailer.welcome_email(@invitation).deliver
  end

end
