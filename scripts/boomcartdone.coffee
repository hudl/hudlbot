# Boom cart done!
#
# ???

boom = [
 "https://i.imgur.com/lLw9eY9.jpg"
,"http://i.imgur.com/SMuFDx4.gif"]

module.exports = (robot) ->
  robot.hear /.*(boom).*/i, (msg) ->
    var rand = Math.random()
    if rand > 0.6 then msg.send msg.random boom
