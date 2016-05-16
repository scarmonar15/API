class TeamsProject < ActiveRecord::Base
  belongs_to :team
  belongs_to :project
end
