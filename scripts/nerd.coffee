# Get those nerds!

module.exports = (robot) ->
  robot.hear /\s?ne+rd[s]?\s?/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=gZEdDMQZaCU"