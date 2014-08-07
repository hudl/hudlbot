# How Tall is Michael Hollman????
#
# The world needs an easy way to know.

module.exports = (robot) ->
  robot.respond /how tall is michael hollman/i, (msg) ->
    msg.send "@Hollman is 6'8\""
