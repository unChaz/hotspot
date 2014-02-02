json.array!(@locations) do |location|
  json.extract! location, :id, :name, :owner, :lat, :long, :description
  json.url location_url(location, format: :json)
end
