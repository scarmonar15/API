json.array!(@counselings_students) do |counselings_student|
  json.extract! counselings_student, :id, :counseling_id, :student_id
  json.url counselings_student_url(counselings_student, format: :json)
end
