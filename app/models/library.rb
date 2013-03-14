class Library < ActiveRecord::Base
  attr_accessible :name, :address, :postcode, :dialling, :telephone, :email, :access_details
	def self.query(search)
	    search_condition =  "%#{search}%"
    	find(:all, :conditions => ['postcode LIKE ? OR address LIKE ? ', search_condition, search_condition])
	end
end
