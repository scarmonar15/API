json.array!(@learnings) do |learning|
  json.extract! learning, :id, :name
  json.url learning_url(learning, format: :json)
end
