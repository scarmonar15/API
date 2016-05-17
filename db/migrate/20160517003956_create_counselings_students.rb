class CreateCounselingsStudents < ActiveRecord::Migration
  def change
    create_table :counselings_students do |t|
      t.references :counseling, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
