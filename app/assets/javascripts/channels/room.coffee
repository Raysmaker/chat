App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Подключение')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Отключение')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('Данные ' + data)

  speak: (message) ->
    # to room_channel.rb
    @perform 'speak', message: message
