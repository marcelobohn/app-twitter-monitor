require 'rails_helper'

RSpec.describe TwitterApi do
  describe '.search' do
    it 'runs the engine' do
      result = double(:result)
      expect(TwitterApi).to receive(:search).with('foo') { result }
      expect(described_class.search('foo')).to eq result
    end
  end
end
