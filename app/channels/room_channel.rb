class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.info('Присоединился в файле .rb')
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info('Отсоединился в файле .rb')
  end

  def speak(from_browser)
    #logger.info("ваш текст: #{data.inspect}")

    ActionCable.server.broadcast 'room_channel', from_browser['message']
  end
end
