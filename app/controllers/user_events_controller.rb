class UserEventsController < ApplicationController
  before_action :check_event_date

  def create
    UserEvent.create(:user_id => current_user.id, :event_id => params[:event_id])
    render js: "window.location.reload()" and return
  end

  def destroy
    @user_event = UserEvent.where(:user_id => current_user.id, :event_id => params[:event_id]).first
    @user_event.destroy()
    render js: "window.location.reload()" and return
  end

  private

  def check_event_date
    event = Event.find_by_id(params[:event_id])
    if event.is_past_event?
      flash[:alert] = "It is a past event"
      redirect_back(fallback_location: root_path)
    end
  end

end
