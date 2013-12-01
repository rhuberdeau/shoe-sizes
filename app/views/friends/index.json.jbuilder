json.array!(@friends) do |friend|
  json.extract! friend, :name, :age
  json.url friend_url(friend, format: :json)
end
