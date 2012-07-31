class HomeController < ApplicationController
  def index
    @events = Event.all()
    @event = Event.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @event }
    end
  end
end
