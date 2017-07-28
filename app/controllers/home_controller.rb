class HomeController < ApplicationController
  before_action :authenticate_user!, only: :appointments
  
  def index
  end

  def appointments
    user = User.find(current_user.id)
    @location_apps = user.location_apps
    @money_apps = user.money_apps

    @notification = user.notifications
  end

  # showMyPage 최혁 추가 부분
  def showMyPage

  end

end
