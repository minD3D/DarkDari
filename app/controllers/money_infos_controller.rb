class MoneyInfosController < ApplicationController
  before_action :set_info
  before_action :builder?

  def create

  end

  def make_done
    @info.done = true
    @info.save

    redirect_to :back
  end

  private

  def set_info
    @info = MoneyInfo.find(params[:id])
  end

  # 완료 시킬 때, 빌더인지 확인
  def builder?
    builder = @info.money_app.money_infos.find_by(builder: true)
    redirect_to root_path unless current_user.id == builder.user_id
  end

end
