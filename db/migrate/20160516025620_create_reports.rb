class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :student, index: true
      t.string :description

      t.timestamps
    end
  end
end
