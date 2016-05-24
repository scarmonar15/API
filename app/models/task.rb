class Task < ActiveRecord::Base
  belongs_to :assignment
  has_and_belongs_to_many :students

  def get_students
  	response = []
  	self.students.map {|s| response << {id: s.id, name: s.name, last_name: s.last_name, email: s.email}}
  	return response
  end

  def get_assignment
  	response = {id: self.assignment.id, 
  				limit_date: self.assignment.limit_date, 
  				grade: self.assignment.grade, 
  				project: self.assignment.get_project
  				}
  	return response
  end
end
