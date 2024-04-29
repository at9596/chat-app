class NotificationsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @notifications = user.notifications
  end

  def edit
  end

  def update
  end
end
