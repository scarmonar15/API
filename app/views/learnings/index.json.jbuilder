json.array!(@learnings) do |learning|
  json.extract! learning, :id, :name, :student_id
  json.url learning_url(learning, format: :json)
end
