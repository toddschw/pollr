json.array!(@results) do |result|
  json.extract! result, :id, :candidate, :votes
  json.url result_url(result, format: :json)
end
