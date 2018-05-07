json.extract! course, :id, :kind, :code, :name, :turn, :type, :created_at, :updated_at
json.url course_url(course, format: :json)
