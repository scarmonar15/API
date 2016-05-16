class Assignment < ActiveRecord::Base
  belongs_to :project
  has_many :tasks
  has_and_belongs_to_many :teams
end
