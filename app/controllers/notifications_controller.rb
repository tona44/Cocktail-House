class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications.all.page(params[:page]).per(5)

    @notifications.each do |notification|
      notification.update_attribute(:checked, true)
    end
  end

end
