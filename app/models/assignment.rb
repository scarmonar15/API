class Assignment < ActiveRecord::Base
  	belongs_to :project
  	has_many :tasks
	
	has_many :teams, through: :teams_assignments
	has_many :teams_assignments
end
