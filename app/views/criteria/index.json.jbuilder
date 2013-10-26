json.array!(@criteria) do |criterium|
  json.extract! criterium, :criteria
  json.url criterium_url(criterium, format: :json)
end
