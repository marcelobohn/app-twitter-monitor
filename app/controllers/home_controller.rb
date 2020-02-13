class HomeController < ApplicationController
  def index
    @hashtags = Hashtag.limit(10)
  end
end
