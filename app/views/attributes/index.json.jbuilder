json.array!(@attributes) do |attribute|
  json.extract! attribute, :id, :name, :level, :avatar, :character_id
  json.url attribute_url(attribute, format: :json)
end
