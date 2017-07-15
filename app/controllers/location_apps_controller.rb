class LocationAppsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location_app, only: [:show, :edit, :update, :destroy]
  before_action :authorized?, only: [:edit, :update, :destroy]

  def show

  end

  def new
    @location_app = LocationApp.new
  end

  def edit

  end

  def create
  end

  def update

  end

  def destroy

  end

  private

  def set_location_app
    @location_app = LocationApp.find(params[:id])
  end

  # 수정, 삭제 본인 확인
  def authorized?
    builder = @money_app.location_infos.find_by(builder: true)
    if current_user.id != builder.user_id
      redirect_to root_path
    end
  end

  def location_info
    LocationInfo.create(user_id: current_user.id,
                     location_app_id: @location_app.id,
                     builder: true)
  end

end
