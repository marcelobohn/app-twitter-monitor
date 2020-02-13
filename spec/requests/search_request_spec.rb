require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /:term" do
    it "returns http success", vcr: { cassette_name: 'fake_twitter_api_facebook' }  do
      get "/search/brazil"
      expect(response).to have_http_status(:success)
    end
  end
end
