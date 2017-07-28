class NotificationsController < ApplicationController
  def create

    case params[:type]
      when 'AppNote'
        app = MoneyApp.find(params[:app_id])
        app_notification = AppNote.new(app_id: app.id,
                                       user_id: params[:user_id],
                                       requester_id: current_user.id)
        app_notification.message = "<em>" + app.title + "</em>" + "에 초대되셨습니다!"
        app_notification.save
      when 'LocationNote'
        # TODO: 나중에 location이랑 머니랑 구분할 수 있게 하기
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
