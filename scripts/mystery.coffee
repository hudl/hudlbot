# Mystery
#
# This calls for a detective!

module.exports = (robot) ->
  robot.hear /.*mystery.*/i, (msg) ->
    msg.send "A mystery you say? I'm on it!"