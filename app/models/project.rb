class Project < ActiveRecord::Base
	has_many :assignments
	has_and_belongs_to_many :teams
end
