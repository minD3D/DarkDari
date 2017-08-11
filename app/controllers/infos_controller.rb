class InfosController < ApplicationController
  before_action :set_info, only: :done
  before_action :builder?, only: :done

  def create
    @notification = Notification.find(params[:notification_id])
    @user = @notification.user
    @info = @user.infos.new(appointment_id: @notification.appointment_id)
    @appointment = @info.appointment

    if @notification.destroy && @info.save
      respond_to do |format|
        format.js
      end
    end
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
  # TODO: 빌더가 아니여도 장소에 도착했을 때는 완료 시킬 수 있게 하기
  def builder?
    builder = @info.find_builder
    redirect_to root_path unless current_user.id == builder.user_id
  end
end
