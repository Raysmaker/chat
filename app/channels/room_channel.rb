class RoomChannel < ApplicationCable::Channel
  def subscribed
     logger.info("Подписка на канал, слушать из канала #{params[:roomId]}")
    @room = Room.find(params[:roomId])
    
    stream_from "room_channel_#{@room.id}"
    speak('message' => '* * * joined the room * * *')
  end

  def unsubscribed
    speak('message' => '* * * left the room * * *')
  end

  def speak(data)
    MessageService.new(
      body: data['message'], user: current_user, room: @room
      ).perform
  end
end
