class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification)
    # @notifications = current_user.notifications
    # authorize @notification
  end

  def show
    @notification = Notification.find(params[:id])
    authorize @notification
    @notification.mark_as_read!
    redirect_to @notification.to_notification.url
  end
end
