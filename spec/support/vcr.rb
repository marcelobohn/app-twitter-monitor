VCR.configure do |c|
  c.configure_rspec_metadata!
  c.default_cassette_options = {
    match_requests_on: %i[method uri body],
    serialize_with: :json,
    # serialize_with: :yaml,
    record: :new_episodes
  }
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
end
