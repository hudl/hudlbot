# Boom cart done!
#
# ???

module.exports = (robot) ->
  robot.hear /.*(boom).*/i, (msg) ->
    msg.send "http://i.imgur.com/SMuFDx4.gif"
