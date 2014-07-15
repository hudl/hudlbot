
# Description:
#   Summons the wisdom of Reggie.
#
# Author:
#   Brendan Smith

module.exports = (robot) ->
  robot.hear /no johns/i, (msg) ->
    msg.send "http://i.imgur.com/vaSQoCl.gif"