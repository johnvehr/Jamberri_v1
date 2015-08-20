json.array!(@events) do |event|
  json.extract! event, :id, :event_title, :starts_at, :time_zone
  json.url event_url(event, format: :json)
end
