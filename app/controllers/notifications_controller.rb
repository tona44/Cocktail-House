class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.all.page(params[:page]).per(10)

    @notifications.each do |notification|
      notification.update_attribute(:checked, true)
    end
  end

end
