# Food
#
# ???

gifs = [
    "http://motorcitygas.files.wordpress.com/2013/10/kirby-inhaling-food.gif"
    "http://www.survivingcollege.com/wp-content/uploads/2013/10/tumblr_lyd6q0cPm01r3b1tu.gif"	
]

module.exports = (robot) ->
#  robot.hear /^food$/i, (msg) ->
#    msg.send "Thanks #{msg.message.user.name}, I'll let everybody know!"
#    robot.http("http://bclymer.unl.edu:42420/inbound/food")
#      .post() (err, res, body) ->
#        msg.send()
  robot.hear /.*(Food is here).*/, (msg) ->
    now = new Date().getHours()
    msg.send msg.random gifs  if now is 11 or now is 12
  robot.hear /lunch/i, (msg) ->
    message = msg.message.text.toLowerCase()
    date = new Date().getDay()
    unless message.indexOf("monday") is -1
      date = 1
    else unless message.indexOf("tuesday") is -1
      date = 2
    else unless message.indexOf("wednesday") is -1
      date = 3
    else unless message.indexOf("thursday") is -1
      date = 4
    else unless message.indexOf("friday") is -1
      date = 5
    else unless message.indexOf("saturday") is -1
      date = 6
    else unless message.indexOf("tomorrow") is -1
      date++
    else date = 0  unless message.indexOf("sunday") is -1
    robot.http("http://nugget:42420/display/food/data/food?day=" + date)
      .get() (err, res, body) ->
        msg.send(body)