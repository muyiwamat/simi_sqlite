class Library < ActiveRecord::Base
  attr_accessible :access_details, :address, :dialling, :email, :name, :postcode, :telephone
	def self.query(search)
	    search_condition =  "%#{search}%"
    	find(:all, :conditions => ['postcode LIKE ? ', search_condition])
    	# find(:all, :conditions => ['name LIKE ? OR author LIKE ? OR genre LIKE ? OR isbn LIKE ? OR edition LIKE ? OR comment LIKE ? OR media_type LIKE ?', search_condition, search_condition, search_condition, search_condition, search_condition, search_condition, search_condition])
	end
end
