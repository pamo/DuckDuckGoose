json.array!(@users) do |user|
  json.extract! user, :industry, :name, :linkedin
  json.url user_url(user, format: :json)
end
