json.array!(@families) do |family|
  json.extract! family, :name
  json.url family_url(family, format: :json)
end