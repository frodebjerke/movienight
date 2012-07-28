class EventController < ApplicationController
  def event
    @Event = Event.find(params[:id])
  end
end
