class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications.all

    @notifications.each do |notification|
      notification.update_attribute(:checked, true)
    end
  end

end
