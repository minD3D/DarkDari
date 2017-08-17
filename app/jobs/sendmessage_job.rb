class SendmessageJob < ApplicationJob
  queue_as :default

  def perform(id, period)
    @appointment = Appointment.find(id)


    confirm = true

    @appointment.infos.each do |infos|
      unless infos.done
        confirm = false

        Text.all.shuffle.each do |text|
          @sms =text.text
        end


        user = infos.user
        client = Coolsms::Client.new(:api_key => ENV['cool_sms_key'],
                                     :api_secret => ENV['cool_sms_secret_key'],
                                     :sender => '01063507688')

        client.send_message :to => user.phone, :text => @sms
      end
    end

    unless confirm
      SendmessageJob.set(wait: 1.minutes).perform_later(id, period)
    end

  end


end

