class CreateLearnings < ActiveRecord::Migration
  def change
    create_table :learnings do |t|
      t.string :name

      t.timestamps
    end
  end
end
