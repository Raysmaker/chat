$(document).on 'turbolinks:load', ->
  messages = $('#messages')

  if messages.length > 0
    createRoomChannel messages.data('room-id')

createRoomChannel = (roomId) ->
  App.room = App.cable.subscriptions.create {channel: "RoomChannel", roomId: roomId},
    connected: ->
      console.log("(3) Подключение к каналу при создании комнаты")
 
    disconnected: ->
      console.log('Отключение')

    received: (data) ->
      console.log('(6) Получение данных из канала:  ' + data)

    speak: (message) ->
      console.log('(4) Вещание в канал: ' + message)
      console.log('(5) Вызов speak в .rb файле')
      @perform 'speak', message: message