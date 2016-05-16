class Learning < ActiveRecord::Base
	has_many :students, through: :learnings_students
	has_many :learnings_students
end
