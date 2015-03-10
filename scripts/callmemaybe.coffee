# Call Me Maybe
#
# "call me maybe" anywhere

module.exports = (robot) ->
  robot.respond /i just met you/i, (msg) ->
          msg.send "and this is crazy"
  robot.respond /here's my number/i, (msg) ->
          msg.send "so call me maybe"

