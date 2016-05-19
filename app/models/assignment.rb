class Assignment < ActiveRecord::Base
  	belongs_to :project
  	has_many :tasks
	
	has_many :teams, through: :teams_assignments
	has_many :teams_assignments

	def self.get_by_date(search_date)
		Assignment.where(limit_date: search_date)
	end
end

