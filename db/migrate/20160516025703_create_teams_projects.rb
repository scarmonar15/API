class CreateTeamsProjects < ActiveRecord::Migration
  def change
    create_table :teams_projects do |t|
      t.references :team, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
