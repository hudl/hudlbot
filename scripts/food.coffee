# Food
#
# ???

module.exports = (robot) ->
  robot.hear /.*(food).*/i, (msg) ->
    msg.send "http://gifs.gifbin.com/160g6g63g654.gif"
