json.extract! user, :id, :name, :mail, :password, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
