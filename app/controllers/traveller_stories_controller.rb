class TravellerStoriesController < ApplicationController
  def index
    @traveller_stories = TravellerStory.all
  end
end
