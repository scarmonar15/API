class Team < ActiveRecord::Base
	has_many :students
	
	has_many :projects, through: :teams_projects
	has_many :teams_projects

	has_many :assignments, through: :teams_assignments
	has_many :teams_assignments

	def get_students
		return self.students.map{|s| {id: s.id, name: s.name, last_name: s.last_name, email: s.email}}
	end
end
