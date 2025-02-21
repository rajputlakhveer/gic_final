class CareersController < ApplicationController
  def index
    @careers = Career.all
  end
end
