json.array!(@teams_assignments) do |teams_assignment|
  json.extract! teams_assignment, :id, :team_id, :assignment_id
  json.url teams_assignment_url(teams_assignment, format: :json)
end
