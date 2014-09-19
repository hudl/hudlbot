# Get those nerds!

module.exports = (robot) ->
  robot.hear /nerd/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=gZEdDMQZaCU"