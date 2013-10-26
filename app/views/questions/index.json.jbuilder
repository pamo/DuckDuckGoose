json.array!(@questions) do |question|
  json.extract! question, :question, :userid, :filterid
  json.url question_url(question, format: :json)
end
