class MoneyAppsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_money_app, only: [:show, :edit, :update, :destroy]
  before_action :authorized?, only: [:edit, :update, :destroy]
  after_action :money_info, only: :create

  def show
    @users = @money_app.users
  end

  def new
    @money_app = MoneyApp.new
  end

  def edit

  end

  def create
    @money_app = MoneyApp.new(money_params)
    @money_app.save

    redirect_to money_app_path(@money_app)
  end

  def update

  end

  def destroy
    @money_app.destroy

    redirect_to home_appointments_path
  end

  private

  def set_money_app
    @money_app = MoneyApp.find(params[:id])
  end

  def money_params
    params.require(:money_app).permit(:title, :content, :deadline, :total_money)
  end

  # 수정, 삭제 본인 확인
  def authorized?
    builder = @money_app.money_infos.find_by(builder: true)
    if current_user.id != builder.user_id
      redirect_to root_path
    end
  end

  def money_info
    MoneyInfo.create(user_id: current_user.id,
                     money_app_id: @money_app.id,
                     builder: true)
  end

end
