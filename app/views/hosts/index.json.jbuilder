json.array!(@hosts) do |host|
  json.extract! host, :id, :host_title, :host_bio
  json.url host_url(host, format: :json)
end
