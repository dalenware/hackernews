json.array!(@users) do |user|
  json.extract! user, :id, :title, :content
  json.url user_url(user, format: :json)
end
