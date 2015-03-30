json.array!(@costs) do |cost|
  json.extract! cost, :id, :cost_date, :item, :money
  json.url cost_url(cost, format: :json)
end
