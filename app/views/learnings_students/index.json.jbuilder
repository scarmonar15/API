json.array!(@learnings_students) do |learnings_student|
  json.extract! learnings_student, :id, :learning_id, :student_id
  json.url learnings_student_url(learnings_student, format: :json)
end
