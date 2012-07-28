class HomeController < ApplicationController
  def index
    @Events = Event.all()
  end
end
