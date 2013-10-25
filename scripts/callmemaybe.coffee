# Call Me Maybe
#
# "call me maybe" anywhere

module.exports = (robot) ->
  robot.hear /.*i just met you.*/, (msg) ->
          msg.send "and this is crazy"
  robot.hear /.*here's my number.*/, (msg) ->
          msg.send "so call me maybe"

