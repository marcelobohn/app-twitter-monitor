class FakeTwitterApi
  def initialize
    @conn = Faraday.new(url: 'https://fake-tweets-api.herokuapp.com/', request: { timeout: self.default_options[:timeout] }) do |f|
      f.adapter :patron
    end
  end

  def self.search(term)
    new.search(term)
  end

  def search(term)
    search_tweet(term)
  end

  private

  mattr_accessor :default_options, instance_writer: false

  self.default_options = {
    timeout: 2,
    base_uri: '',
    headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  }

  def self.base_uri(uri)
    default_options[:base_uri] = uri
  end

  def self.add_header(name, value)
    default_options[:headers][name] = value
  end

  def self.timeout(value)
    default_options[:timeout] = value
  end

  def request(method, path, options = {})
    max_retry ||= options.fetch(:retry, 3)
    data = options[:data].try(:to_json)
    headers = options.fetch(:headers, {})
    @conn.run_request method, path, data, self.default_options[:headers].merge(headers)
  rescue Faraday::TimeoutError, Faraday::ConnectionFailed
    raise if max_retry.zero?
    max_retry -= 1
    retry
  end

  def process_response(response)
    code = response.status
    if [200, 422].include?(code) && response.body.present?
      JSON.parse(response.body, allow_nan: true)
    else
      {}
    end
  end

  def search_tweet(term)
    result = request(:get, "posts?word=#{term}", retry: 0)
    { body: process_response(result), status: result.status }
  end
end
