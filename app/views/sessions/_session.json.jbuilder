json.extract! session, :id, :title, :description, :user, :created_at, :updated_at
json.url session_url(session, format: :json)
