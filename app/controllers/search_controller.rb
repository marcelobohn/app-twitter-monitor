class SearchController < ApplicationController
  def index
    @term = params[:term]

    if ENV['FAKE_API'] == 'true'
      @tweets = FakeTwitterApi.search(@term)
    else
      @tweets = TwitterApi.search(@term)
      @message = 'Search in API was not possible' if @tweets.nil?
    end
  end
end
