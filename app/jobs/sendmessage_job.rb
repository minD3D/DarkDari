class SendmessageJob < ApplicationJob
  queue_as :default

  def perform(id, period)
    @appointment = Appointment.find(id)


    @confirm = true

    @appointment.infos.each do |infos|
      unless infos.done
        @confirm = false

        @texts= Text.all
        @texts.shuffle.each do |text|
        @sms =text.text
        end


        user = infos.user


        #저장된 text  가지고 오기

       # ConfirmJobJob.set(wait: (1.seconds).perform_later(id, period, infos.user_id))

      #coolsms 기능   api key , secret key 설정하기
      client = Coolsms::Client.new :api_key => ENV['cool_sms_key'],
      :api_secret => ENV['cool_sms_secret_key'], :sender => '01063507688'

      client.send_message :to =>user.phone , :text => @sms
      end
      end

    if @confirm

    #send message every period seconds    second -> minutes로 바꿔야함
    else
      SendmessageJob.set(wait: 1.minutes).perform_later(id,period)
    end


  end

end
