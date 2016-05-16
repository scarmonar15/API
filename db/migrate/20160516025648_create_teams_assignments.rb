class CreateTeamsAssignments < ActiveRecord::Migration
  def change
    create_table :teams_assignments do |t|
      t.references :team, index: true
      t.references :assignment, index: true

      t.timestamps
    end
  end
end
