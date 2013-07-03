json.array!(@addresses) do |address|
  json.extract! address, :addressable_id, :addressable_type, :line_1, :line_2, :line_3, :city, :state, :zip
  json.url address_url(address, format: :json)
end