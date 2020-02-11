require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  let(:hashtag) { create(:hashtag) }

  context 'created by bot' do
    it 'default value' do
      expect(hashtag.term).to eq('railsbrazil')
    end
  end
end
