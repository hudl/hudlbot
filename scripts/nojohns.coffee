
# Description:
#   Summons the wisdom of Reggie.
#
# Author:
#   Brendan Smith

module.exports = (robot) ->
  robot.respond /no johns/i, (msg) ->
    msg.send "https://s3.amazonaws.com/hudl-internal-assets/vaSQoCl.gif"