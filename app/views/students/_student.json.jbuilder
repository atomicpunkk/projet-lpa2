json.extract! student, :id, :name, :nickname, :birthdate, :created_at, :updated_at
json.url student_url(student, format: :json)
