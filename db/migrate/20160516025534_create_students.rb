class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.references :team, index: true

      t.timestamps
    end
  end
end
