class EventController < ApplicationController
  def event
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @event }
    end
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event)}#, :notice => 'Success!')}
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
end
