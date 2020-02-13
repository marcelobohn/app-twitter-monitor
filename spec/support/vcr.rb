VCR.configure do |c|
  c.configure_rspec_metadata!
  c.default_cassette_options = {
    match_requests_on: %i[method uri body],
    serialize_with: :json,
    record: :new_episodes
  }
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :faraday

  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end
