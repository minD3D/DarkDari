class HomeController < ApplicationController
  before_action :authenticate_user!, only: :show_my_page
  
  def index
  end

  def appointments
    user = User.find(current_user.id)
    @appointments = user.appointments

    @notifications = user.notifications
  end

  # showMyPage 최혁 추가 부분
  def show_my_page
    user = User.find(current_user.id)
    @appointments = user.appointments

    @notifications = user.notifications
  end

end
