class UsersController < ApplicationController

  def index
    @users = User.joins(:user_events).where("user_events.event_id =?", params[:event_id])
               .paginate(page: params[:page], per_page: 15)
  end
end
