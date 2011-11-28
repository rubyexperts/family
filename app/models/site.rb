class Site < ActiveRecord::Base

    has_many :users
    
    validates_presence_of :name, :message => "must be entered."  #, :if => :name, :message => "must be entered." 
    validates_uniqueness_of :name, :message => "must be unique." #, :if => :name, :message => "must be unique." 
    validates_format_of :name, :with => /^[a-zA-Z0-9\-]*?$/, 
                        :message => 'accepts only letters, numbers and hyphens'
                        
                        
                        
    def get_admin
      self.users.find_by_type("Admin")
    end
    
    def self.all_sites
      find(:all, :conditions => ['name != ?', "admin"], :order => :name)
    end
   

end
