class Assignment < ActiveRecord::Base
  	belongs_to :project
  	has_many :tasks
	
	has_many :teams, through: :teams_assignments
	has_many :teams_assignments

	def self.get_by_date(search_date)
		Assignment.where(limit_date: search_date)
	end

	def build_report
	  teams = self.teams
	  students = []
	  students = teams.map {|t| t.students}
	  response = {}
	  response[:project] = {id: self.project.id, title: self.project.title, description: self.project.description}
	  response[:id] = self.id
	  response[:description] = self.description
	  response[:limit_date] = self.limit_date
	  response[:teams] = []
	  teams.each do |team|
	    response[:teams] << {
	      id: team.id,
	      students: team.get_students
	    }
	  end
	  return response
	end
end

