class HomeController < ApplicationController
  def index
    @all_tweets = Tweet.all
  end
end
