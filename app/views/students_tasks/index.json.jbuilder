json.array!(@students_tasks) do |students_task|
  json.extract! students_task, :id, :student_id, :task_id
  json.url students_task_url(students_task, format: :json)
end
