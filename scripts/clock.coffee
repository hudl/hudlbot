# Description:
#   Allows an intern to clock in and out through Brehm
#
# Commands:
#   hubot clock in - Clocks in at the current time
#   hubot clock out - Clocks out at the current time
#   hubot clock me <start> <finish> - Clocks in at <start> and out at <finish>
#   hubot clock register <username> <password> - How Brehm should authenticate you on timetracker
#   hubot clock help - Shows the list of clock commands 

class Clock

  prefix = "clock_auth_"

  constructor: (@robot) ->
    @myRobot = @robot

  lookupUser: (msg) ->
    login = @myRobot.brain.data[@getKey(msg)]
    if login is `undefined`
      msg.send "You are not registered yet. Use 'clock register <username> <password>' to register"
      true
    else
      @fromBase(login)

  storeUser: (msg, user, pass) ->
    if @myRobot.brain.data[@getKey(msg)] is `undefined`
      msg.send "Warning: This info is stored on the brehm machine, not accessible, but still locally. Run the same command again to register"
      @myRobot.brain.data[@getKey(msg)] = @toBase("unregistered")
    else
      @myRobot.brain.data[@getKey(msg)] = @toBase(user + "/" + pass)

  removeUser: (msg) ->
    @myRobot.brain.data[@getKey(msg)] = `undefined`

  getKey: (msg) ->
    prefix + msg.message.user["jid"]

  toBase: (str) ->
    new Buffer(str).toString('base64')

  fromBase: (str) ->
    new Buffer(str, 'base64').toString('utf8')

module.exports = (robot) ->

  clock = new Clock robot

  robot.respond /clock in/i, (msg) ->
    unless clock.lookupUser(msg) is true
      robot.http("http://localhost:12346/exec/clock/in/-1/-1/" + clock.lookupUser(msg))
        .get() (err, res, body) ->
          msg.send(body)

  robot.respond /clock out/i, (msg) ->
    unless clock.lookupUser(msg) is true
      robot.http("http://localhost:12346/exec/clock/out/-1/-1/" + clock.lookupUser(msg))
        .get() (err, res, body) ->
          msg.send(body)

  robot.respond /clock me (([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]) (([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9])/i, (msg) ->
    unless clock.lookupUser(msg) is true
      robot.http("http://localhost:12346/exec/clock/me/" + msg.match[1] + "/" + msg.match[3] + "/" + clock.lookupUser(msg))
        .get() (err, res, body) ->
          msg.send(body)

  robot.respond /clock register ([^\s]+) ([^\s]+)/i, (msg) ->
    clock.storeUser(msg, msg.match[1], msg.match[2])
    msg.send("You are: " + clock.lookupUser(msg))

  robot.respond /clock unregister/i, (msg) ->
    clock.removeUser(msg)
    msg.send("You are unregistered.")

  robot.respond /clock help/i, (msg) ->
    msg.send("@Brehmbot clock in - Clocks in at the current time hubot\n @Brehmbot clock out - Clocks out at the current time hubot\n @Brehmbot clock me <start> <finish> - Clocks in at <start> and out at <finish>\n @Brehmbot clock register <username> <password> - How Brehm should authenticate you on timetracker\n @Brehmbot clock help - Recursion")

