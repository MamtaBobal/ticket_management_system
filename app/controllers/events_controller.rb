class EventsController < ApplicationController

  def index
    @events = Event.includes(:user_events).paginate(page: params[:page], per_page: 15)
                .order(created_at: :asc)
  end

end
