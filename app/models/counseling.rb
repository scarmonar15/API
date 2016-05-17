class Counseling < ActiveRecord::Base
	has_many :students, through: :counselings_students
	has_many :counselings_students
end
