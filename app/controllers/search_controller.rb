class SearchController < ApplicationController
  def index
    @term = params[:term]
    @tweets = ENV['FAKE_API'] ? FakeTwitterApi.search(@term) : TwitterApi.search(@term)
  end
end
