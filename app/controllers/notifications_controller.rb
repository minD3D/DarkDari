class NotificationsController < ApplicationController
  def create

    case params[:type]
      when 'AppNote'
        appointment = Appointment.find(params[:appointment_id])
        app_notification = AppNote.new(appointment_id: appointment.id,
                                       user_id: params[:user_id],
                                       requester_id: current_user.id)
        app_notification.message = "<em>" + appointment.title + "</em>" + "에 초대되셨습니다!"
        app_notification.save
      when 'FriendNote'
        redirect_to '/'
      else
        redirect_to '/'
    end

    redirect_to :back

  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy

    redirect_to :back
  end

end
