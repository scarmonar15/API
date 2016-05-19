class Student < ActiveRecord::Base
  belongs_to :team
  has_many :reports
  has_and_belongs_to_many :tasks
  has_many :learnings, through: :learnings_students
  has_many :learnings_students

  has_many :counselings, through: :counselings_students
  has_many :counselings_students

  def full_name
  	return self.name + " " + self.last_name
  end

  def self.students_alone
    return Student.where("team_id is ?", nil)
  end
end
