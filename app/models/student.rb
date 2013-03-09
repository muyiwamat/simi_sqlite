class Student < ActiveRecord::Base
  attr_accessible :name, :student_id, :password, :password_confirmation
  has_secure_password
  #define before_save{ |student| to ensure dat student.student_id is integer }
  validates :name, presence: true 	# validates :name, :student_id, presence: true
  validates :student_id, presence: true, uniqueness: true, numericality: true #not confirming dat value is integer #we cld decide to make it int or string like(511261ay)
#numericality might not work if my assumption is right in dat rails might try converting d string to integer and in dat case it wld b zero which wld lead to d test passing...
  validates_length_of :student_id, is: 8
  validates :password, length: { minimum: 7 }
  # validates :password, presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true
end
