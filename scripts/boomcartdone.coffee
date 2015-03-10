# Boom cart done!
#
# ???
# Retired Rees Gif:
# http://i.imgur.com/SMuFDx4.gif

module.exports = (robot) ->
  robot.respond /.*(boom).*/i, (msg) ->
    msg.send "https://i.imgur.com/lLw9eY9.jpg"
