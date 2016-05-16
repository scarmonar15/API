class Project < ActiveRecord::Base
	has_many :assignments
	has_many :teams, through: :teams_projects
	has_many :teams_projects
end
