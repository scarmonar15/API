class CreateStudentsTasks < ActiveRecord::Migration
  def change
    create_table :students_tasks do |t|
      t.references :student, index: true
      t.references :task, index: true

      t.timestamps
    end
  end
end
