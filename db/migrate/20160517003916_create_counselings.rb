class CreateCounselings < ActiveRecord::Migration
  def change
    create_table :counselings do |t|
      t.date :date
      t.string :adviser
      t.string :classroom
      t.timestamps
    end
  end
end
