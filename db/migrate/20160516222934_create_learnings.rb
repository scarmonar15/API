class CreateLearnings < ActiveRecord::Migration
  def change
    create_table :learnings do |t|
      t.string :name
      t.references :student, index: true

      t.timestamps
    end
  end
end
