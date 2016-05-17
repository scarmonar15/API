json.array!(@counselings) do |counseling|
  json.extract! counseling, :id, :date, :adviser, :classroom
  json.url counseling_url(counseling, format: :json)
end
