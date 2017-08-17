class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :builder?, only: [:edit, :update, :destroy]
  before_action :get_location, only: [:show, :edit]
  after_action :set_info, only: :create

  def show
    @infos = @appointment.infos

    @inviting_user = @appointment.inviting_users
    @search_users = User.search(params[:s_nickname])
    render layout: false
  end

  def new
    @app_type = params[:app_type]
    @appointment = Appointment.new
  end

  def edit
    @app_type = @appointment.app_type
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.app_type = params[:app_type]
    @app_type = @appointment.app_type

    if @appointment.save
      #active job 부분
      @now = Time.now.utc
      @now =@now -(@now.sec).seconds
      @now =@now +9.hour
      #현재 시간 구하기
      @difference = TimeDifference.between(@appointment.deadline,@now).in_minutes
      @num = @difference.to_i

      if @num>30
        SendmessageJob.set(wait: (@num-30).minute).perform_later(@appointment.id,@appointment.period)
      else
        SendmessageJob.set(wait: 3.seconds).perform_later(@appointment.id,@appointment.period)
      end


      redirect_to home_show_my_page_path
    else
      render 'new'
    end

  end

  def update
    @app_type = @appointment.app_type
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render 'edit'
    end
  end

  def destroy
    if @appointment.destroy
      respond_to do |format|
        format.js
      end
    end
    # redirect_to home_show_my_page_path
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def get_location
    if @appointment.app_type == 'LocationApp'
      @location = @appointment.location.delete('()').split(', ')
    end
  end

  def appointment_params
    params.require(:appointment).permit(:title, :content, :deadline, :location, :period)
  end

  # 수정, 삭제 본인 확인
  def builder?
    builder = @appointment.infos.find_by(builder: true)
    if current_user.id != builder.user_id
      redirect_to root_path
    end
  end

  # 만든 사람의 id와 글 아이디로 관계 생성, builder: true
  def set_info
    Info.create(user_id: current_user.id,
                appointment_id: @appointment.id,
                builder: true)
  end



end
