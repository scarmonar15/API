json.array!(@reports) do |report|
  json.extract! report, :id, :student_id, :description
  json.url report_url(report, format: :json)
end
