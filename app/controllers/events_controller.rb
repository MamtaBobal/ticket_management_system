class EventsController < ApplicationController

  def index
    @events = Event.all.order(created_at: :asc)
  end

end
