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

  def get_performance
    tasks = self.tasks
    good = 0
    all = 0
    relation = 0
    tasks.each do |t|
      if t.students.include?(self)
        all = all + 1
        if !t.done.blank?
          good = good + 1
        end
      end
    end
    return "No hay datos" if all == 0
    relation = (good.to_f/all.to_f)
    if relation >= 0.85
      return "Excelente"
    elsif relation < 0.85 and relation >= 0.7
      return "Sobresaliente"
    elsif relation < 0.7 and relation >= 0.55
      return "Mediocre"
    elsif relation < 0.55
      return "Deficiente"
    end
  end
end
