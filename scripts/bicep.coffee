# Description:
# Wraps two bicep emotes around whatever you like.

module.exports = (robot) ->
  robot.respond /(bicep )(.*)/i, (msg) ->
    strength = msg.match[2]
    msg.send "(bicepleft) " + strength + " (bicepright)"
