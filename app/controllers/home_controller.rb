class HomeController < ApplicationController
  def map
    @locations = Location.all
  end
end