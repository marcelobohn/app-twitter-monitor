class SearchController < ApplicationController
  def index
    @term = params[:term]

    @tweets = TwitterApi.search(@term)
    @message = 'Search in API was not possible' if @tweets.nil?
  end
end
