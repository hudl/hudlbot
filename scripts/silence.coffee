# Description:
#   Allows an intern to clock in and out through Brehm
#
# Commands:
#   hubot clock in - Clocks in at the current time
#   hubot clock out - Clocks out at the current time
#   hubot clock me <start> <finish> - Clocks in at <start> and out at <finish>
#   hubot register <username> <password> - How Brehm should authenticate you on timetracker

class Silence

  constructor: (@robot) ->
    @myRobot = @robot
    allowedRooms = @myRobot.brain.data["allowed_rooms"]
    if allowedRooms is `undefined`
      @myRobot.brain.data["allowed_rooms"] = []

  iMissYou: (msg) ->
    allowedRooms = @myRobot.brain.data["allowed_rooms"]
    newRoom = msg.message.user["reply_to"]
    @myRobot.brain.data["allowed_rooms"].push(newRoom) unless newRoom in allowedRooms

  shutup: (msg) ->
    allowedRooms = @myRobot.brain.data["allowed_rooms"]
    index = allowedRooms.indexOf(msg.message.user["reply_to"])
    unless index is -1
      allowedRooms.splice(index, 1)
      @myRobot.brain.data["allowed_rooms"] = allowedRooms

module.exports = (robot) ->

  silence = new Silence robot

  robot.respond /(shut up)|silence/i, (msg) ->
    return unless msg.message.user.room
    msg.send "Whatever. If you need me say @BrehmBot I miss you"
    msg.send "/leave"
    silence.shutup msg

  robot.respond /i miss you/i, (msg) ->
    return unless msg.message.user.room
    silence.iMissYou msg
    msg.send "Yay, I missed you too :)"
