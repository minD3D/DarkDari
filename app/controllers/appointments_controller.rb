class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :builder?, only: [:show, :edit, :update, :destroy]
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
    @appointment.save
    redirect_to home_show_my_page_path
  end

  def update
    @appointment.update(appointment_params)
    redirect_to @appointment
  end

  def destroy
    @appointment.destroy
    redirect_to home_show_my_page_path
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
    params.require(:appointment).permit(:title, :content, :deadline, :location)
  end

  # 수정, 삭제 본인 확인
  def builder?
    builder = @appointment.infos.find_by(builder: true)
    if current_user.id != builder.user_id
      redirect_to root_path
    end
  end

  # 만든 사람의 id와 글 아이디로 관계 생성, builder: true
  # TODO: 모델 콜백으로 옮기든 엑티브잡으로 옮기든 해야할듯
  def set_info
    Info.create(user_id: current_user.id,
                appointment_id: @appointment.id,
                builder: true)
  end

end
