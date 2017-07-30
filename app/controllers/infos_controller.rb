class InfosController < ApplicationController
  before_action :set_info, only: :done
  before_action :builder?, only: :done

  def create
    notification = Notification.find(params[:notification_id])
    user = notification.user
    info = user.infos.new(appointment_id: notification.appointment_id)

    info.save
    notification.destroy

    redirect_to :back
  end

  def done
    @info.done = true
    @info.save

    redirect_to :back
  end

  private

  def set_info
    @info = Info.find(params[:id])
  end

  # 완료 시킬 때, 빌더인지 확인
  def builder?
    builder = @info.find_builder
    redirect_to root_path unless current_user.id == builder.user_id
  end
end
