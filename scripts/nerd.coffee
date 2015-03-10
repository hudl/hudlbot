# Get those nerds!

module.exports = (robot) ->
  robot.respond /^\s*ne+rds?\s*$|\sne+rds?\s/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=gZEdDMQZaCU"