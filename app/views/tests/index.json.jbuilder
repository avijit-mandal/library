json.array!(@tests) do |test|
  json.extract! test, :id, :name, :email, :login
  json.url test_url(test, format: :json)
end
