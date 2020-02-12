class SearchController < ApplicationController
  def index
    @term = params[:term]
    # @tweets = TwitterApi.search(@term)
  end
end
