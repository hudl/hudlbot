# It's really tedious to type (bicepleft) [thing] (bicepright).
# Which is a shame, because biceps are really funny looking.

module.exports = (robot) ->
  robot.respond /(bicep)(.*)/i, (msg) ->
    msg.send "(bicepleft) #{msg.match[1]} (bicepright)"
