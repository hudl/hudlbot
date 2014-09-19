# Get those nerds!

module.exports = (robot) ->
  robot.hear /\s?nerd[s]?\s?/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=gZEdDMQZaCU"