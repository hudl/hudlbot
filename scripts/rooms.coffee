rooms = []


module.exports = (robot) ->

  robot.respond /find room in (east|west)/i, (msg) ->
    msg.send "Checking for rooms in " + msg.match[1] + ", 1 sec..."
    robot.http("http://calendars/api/roomlist/hudl" + msg.match[1] + "@hudl.com/availability")
      .get() (err, res, body) ->
        rooms = JSON.parse(body)
        for room in rooms
          msg.send room.Name

   robot.respond /room link me(.*)/i, (msg) ->
     if msg.match[1].length > 1
       msg.match[1] = msg.match[1].trim()
       found = false
     for room in rooms
       if msg.match[1].length == 0
         msg.send room
       else if msg.match[1].length > 0 and (msg.match[1].toLowerCase() is room.split("-")[0].trim().toLowerCase())
         msg.send room
         found = true
     if found is false
       msg.send "Could not find a link for room '" + msg.match[1] + "'." 
