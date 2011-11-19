class UsersController < ApplicationController

   before_filter :authenticate_user!
   before_filter :selected_tab, :only => [:create_master_account]
   before_filter :select_tab, :except => [:create_master_account]
   layout 'default'
   
   def index
      @users = User.all
      @select = "user"
      @select ="admin"
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      end
   end
   
   def new
     @user = User.new
   end

   def show
     @user = User.find(params[:id])
     respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
     end
   end

   def edit
     @user= User.find(params[:id])
   end

   def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user,
                      :notice => 'User Was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors,
                      :status => :unprocessable_entity }
      end
    end
   end

  def destroy
    @user = User.find(params[:id])
    @user.delete
   respond_to do |format|
      format.html { redirect_to'/users' }
      format.xml  { head :ok }
    end
  end

   def create_master_account
     @user = User.new(params[:user])
     if @user.valid?
        @user.master_id = current_user.id
        @user.save
        redirect_to '/doctors'
     else
       render :new
     end
   end
   
   private
   
   def selected_tab
     @select = "admin"
   end
   
   def select_tab
     @select = "My Account"
   end

  
end
