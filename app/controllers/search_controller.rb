class SearchController < ApplicationController
  def index
    @term = params[:term]

    if ENV['FAKE_API'] == 'true'
      @tweets = FakeTwitterApi.search(@term)
    else
      @message = 'Search in oficial Twitter API not implemented'
      # @tweets = TwitterApi.search(@term)
    end
  end
end
