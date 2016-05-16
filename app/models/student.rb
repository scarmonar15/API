class Student < ActiveRecord::Base
  belongs_to :team
  has_many :reports
  has_and_belongs_to_many :tasks
end
