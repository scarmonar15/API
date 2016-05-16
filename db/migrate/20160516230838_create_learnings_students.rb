class CreateLearningsStudents < ActiveRecord::Migration
  def change
    create_table :learnings_students do |t|
      t.references :learning, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
