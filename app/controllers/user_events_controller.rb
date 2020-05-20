class UserEventsController < ApplicationController

  def create
    UserEvent.create(:user_id => current_user.id, :event_id => params[:event_id])
    render js: "window.location.reload()" and return
  end

  def destroy
    @user_event = UserEvent.where(:user_id => current_user.id, :event_id => params[:event_id]).first
    @user_event.destroy()
    render js: "window.location.reload()" and return
  end

end
