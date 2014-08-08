# Description:
#   "Deploys branch to a thor and monitors progress"
# Dependencies:
#   None
# Configuration:
#   None
# Commands:
#   hubot deploy <branch> <app> - deploys an alyx3 branch and monitors it
#   hubot deploy <branch> <app> manual - deploys an alyx3 branch
#   hubot monitor <link> - monitors an alyx branch for status changes

class Monitor
  constructor: (replyTo, robot, url, branch) ->
    @replyTo = replyTo
    @url = url
    @robot = robot
    @status = ''
    @tries = 0
    @branch = branch
    return
  replyTo: () ->
    @replyTo
  tries: () ->
    @tries
  status: () ->
    @status
  setStatus: (status) ->
    @status = status
  incTries: () ->
    @tries = @tries + 1
  check: () ->
    url = encodeURIComponent(@url)
    monitor = this
    @robot.http("http://localhost:12346/exec/alyx/#{url}")
    .get() (err, res, body) ->
      if err
        monitor.robot.send "Error: #{err}"
        return
      time = 5000
      newStatus = ""
      if body.indexOf("building") > 0
        newStatus = "building"
      else if body.indexOf("request-sent") > 0
        newStatus = "request-sent"
        time = 15000
      else if body.indexOf("success") > 0
        newStatus = "success"
      else if body.indexOf("failed") > 0
        newStatus = "failed"
      else
        monitor.robot.send monitor.replyTo "No status found: " + body
        return
      unless newStatus is monitor.status
        monitor.robot.send monitor.replyTo, "Status update for " + monitor.branch + ": " + newStatus
      monitor.setStatus newStatus
      monitor.incTries()
      if newStatus is "success" or newStatus is "failed" or monitor.tries > 20
        if monitor.tries > 20
          monitor.robot.send monitor.replyTo, "Timed out. You can make me monitor again by telling me to \"monitor " + monitor.url + "\""
        else
          monitor.robot.send monitor.replyTo, "Done monitoring " + monitor.branch + monitor.url
        return
      setTimeout () ->
        monitor.check()
      , time
      return

module.exports = (robot) ->
  robot.respond /deploy ([^\s]+) ([^\s]+)/i, (msg) ->
    msg.send "Sending request to Alyx..."
    branch = escape(msg.match[1])
    project = escape(msg.match[2])
    shouldMonitor = (msg.message.text.indexOf('manual') is -1)
    robot.http("http://localhost:12346/exec/alyx/#{branch}/#{project}")
    .get() (err, res, body) ->
      if err
        msg.send "Error: #{err}"
        return
      if body.indexOf('http') == -1
        msg.send "Error: #{body}"
        return
      msg.send "Monitor status manually: #{body}"
      if shouldMonitor
        msg.send "Monitoring " + branch + "..."
        monitor = new Monitor(msg.message.user['jid'], robot, body, branch + ' ')
        monitor.check()

  robot.respond /monitor ([^\s]+)/i, (msg) ->
    url = msg.match[1]
    msg.send "Ok, I'll monitor " + url
    monitor = new Monitor(msg.message.user['jid'], robot, url, '')
    monitor.check()
