class Library < ActiveRecord::Base
  attr_accessible :access_details, :address, :dialling, :email, :name, :postcode, :telephone
end
