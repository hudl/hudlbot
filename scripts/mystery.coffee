# Mystery
#
# This calls for a detective!

module.exports = (robot) ->
  robot.respond /.*mystery.*/i, (msg) ->
    msg.send "A mystery you say? I'm on it!"