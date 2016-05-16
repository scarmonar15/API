json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :last_name, :email
  json.url teacher_url(teacher, format: :json)
end
