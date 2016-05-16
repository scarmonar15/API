json.array!(@teams_projects) do |teams_project|
  json.extract! teams_project, :id, :team_id, :project_id
  json.url teams_project_url(teams_project, format: :json)
end
