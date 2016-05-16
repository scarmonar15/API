class TeamsAssignment < ActiveRecord::Base
  belongs_to :team
  belongs_to :assignment
end
