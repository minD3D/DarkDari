class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :builder?, only: [:edit, :update, :destroy]
  after_action :set_info, only: :create

  def show
    @users = @appointment.users
    @infos = @appointment.infos
    @inviting_user = @appointment.inviting_users

    @search_users = User.search(params[:s_nickname])
  end

  def new
    @type = params[:type]
    @appointment = Appointment.new
  end

  # TODO: 통합하는 과정 new까지만 완료함, create, edit, show, destroy 미완

  def edit
    @type = @appointment.app_type
  end

  def create
    type = params[:type]
    case type
      when 'MoneyApp'
        @appointment = Appointment.new(appointment_params)
        @appointment.app_type = type
      when 'LocationApp'
        @appointment = Appointment.new(appointment_params)
        @appointment.location = params[:appointment][:location].permit
        @appointment.app_type = type
    end
    @appointment.save
    redirect_to home_appointments_path
  end

  def update
    if @money_app.update(money_params)
      redirect_to @money_app
    else
      render 'edit'
    end

  end

  def destroy
    @appointment.destroy
    redirect_to home_appointments_path
  end


  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:title, :content, :deadline)
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
