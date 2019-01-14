class RoomChannel < ApplicationCable::Channel
  def subscribed
    logger.info("Подписка на канал, слушать из канала #{params[:roomId]}")

    @room = Room.find(params[:roomId])

    stream_from "room_channel_#{@room.id}"
  end

  def unsubscribed
    logger.info('Отсоединился в файле. room_channel.rb')
  end

  def speak(data)
    logger.info('Вещать в канал. sreak room_channel.rb')
    ActionCable.server.broadcast "room_channel_#{@room.id}", data['message']
  end
end
