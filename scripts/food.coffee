# Food
#
# ???

gifs = [
    "https://s3.amazonaws.com/hudl-internal-assets/kirby-inhaling-food.gif"
    "https://s3.amazonaws.com/hudl-internal-assets/patrick-burgers.gif"
    "https://s3.amazonaws.com/hudl-internal-assets/chompy.gif"
]

allWeekRandom = false

# Starts with Sunday
cleanup = [
    "Whoever is in on this particular Sunday, you know who you are"
    "Business/Marketing"
    "Design/QA"
    "Accounting/HR"
    "Support"
    "Devs/PMs/IT"
    "Whoever is in on this particular Saturday, you know who you are"
]

module.exports = (robot) ->
  robot.respond /.*(Food is here).*/, (msg) ->
    now = new Date()
    nowHours = now.getHours()    
    msg.send msg.random gifs  if nowHours is 11 or nowHours is 12

  robot.respond /lunch/i, (msg) ->
    return if msg.message.text.match('subscribe')
    return msg.send("(shrug) It's random lunch all week.") if allWeekRandom
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

  robot.respond /clean up/i, (msg) ->
    msg.send("Today " + cleanup[new Date().getDay()] + " should clean up")

  robot.respond /toggle random lunch/i, (msg) ->
    allWeekRandom = !allWeekRandom
    msg.send("Random lunch for week is now set to "+allWeekRandom)	
