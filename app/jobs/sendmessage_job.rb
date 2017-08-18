class SendmessageJob < ApplicationJob
  queue_as :default

  def perform(id, period)
    @appointment = Appointment.find(id)
    confirm = true

    @appointment.infos.each do |infos|
      unless infos.done
        confirm = false

        Text.all.shuffle.each do |text|
          @sms = text.text
        end

        user = infos.user
        client = Coolsms::Client.new(api_key: ENV['cool_sms_key'],
                                     api_secret: ENV['cool_sms_secret_key'],
                                     sender: ENV['hojae_phone'])
        client.send_message to: user.phone, text: @sms
      end

      next

    end

    unless confirm
      SendmessageJob.set(wait: 30.minutes).perform_later(id, period)
    end
  end


end

