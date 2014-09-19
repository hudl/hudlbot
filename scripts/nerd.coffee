# Get those nerds!

module.exports = (robot) ->
  robot.hear /\snerd[s]?\s/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=gZEdDMQZaCU"