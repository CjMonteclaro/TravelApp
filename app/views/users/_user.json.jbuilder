json.extract! user, :id, :username, :email, :enabled, :opt_in, :tos_agreed, :policies_count, :created_at, :updated_at
json.url user_url(user, format: :json)
