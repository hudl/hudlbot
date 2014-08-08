# Description:
#   Tells Brehm to listen for a word for the user/room
#
# Commands:
#   hubot listen for <word> - Be notified when a word is mentioned in any room
#   hubot stop listening for <word> - Stop being notified when a word is mentioned in any room 
#   hubot what are people listening for - Displays a list of words people are listening for 

class Listener

  constructor: (@robot) ->
    @myRobot = @robot
    @myRobot.brain.data["subscribed_words"] = [] if @myRobot.brain.data["subscribed_words"] is `undefined`

   subscribe: (msg) ->
     word = msg.match[2].toLowerCase()
     @myRobot.brain.data["subscribed_words"].push(word) unless word in @myRobot.brain.data["subscribed_words"]
     sub_word = "subscriptions_" + word
     @myRobot.brain.data[sub_word] = [] if @myRobot.brain.data[sub_word] is `undefined`
     if msg.message.user.room is `undefined`
       if msg.message.user["jid"] in @myRobot.brain.data[sub_word]
         return false
       @myRobot.brain.data[sub_word].push(msg.message.user["jid"])
       return true
     else
       if msg.message.user["reply_to"] in @myRobot.brain.data[sub_word]
         return false
       @myRobot.brain.data[sub_word].push(msg.message.user["reply_to"]) unless msg.message.user["reply_to"] in @myRobot.brain.data[sub_word]
       return true

    unsubscribe: (msg) ->
      sub_word = "subscriptions_" + msg.match[2].toLowerCase()
      if msg.message.user.room is `undefined`
        index = @myRobot.brain.data[sub_word].indexOf(msg.message.user["jid"])
      else
        index = @myRobot.brain.data[sub_word].indexOf(msg.message.user["reply_to"])
      @myRobot.brain.data[sub_word].splice(index, 1) if index != -1
      return index
     

module.exports = (robot) ->

  listener = new Listener(robot)

  robot.respond /stop listening (to|for) (.*)/i, (msg) ->
    index = listener.unsubscribe msg
    if index != -1
      msg.send "I am no longer listening for '" + msg.match[2] + "' for you."
    else
      msg.send "I was never listening for '" + msg.match[2] + "' for you. Type '@Brehmbot listen for " + msg.match[2] + "' to listen."

  robot.hear /.*/i, (msg) ->
    return if msg.message.user.room is `undefined`
    subscribed_words = robot.brain.data["subscribed_words"]
    phrase = msg.match[0]
    for word in subscribed_words
      unless phrase.toLowerCase().indexOf(word) is -1
        people = robot.brain.data["subscriptions_" + word]
        for person in people
          robot.send person, msg.message.user.name + " said '" + word + "' in room '" + msg.message.user.room + "': \"" + phrase + "\"" unless msg.message.user["reply_to"] is person

  robot.respond /listen (to|for) (.*)/i, (msg) ->
    msg.match[2] = msg.match[2].trim()
    return if msg.match[2].length == 0
    added = listener.subscribe msg
    if added
      msg.send "I'll let you know when '" + msg.match[2] + "' is said in a room"
    else
      msg.send "I am already listening for '" + msg.match[2] + "' for you."
    
  robot.respond /what are people listening for/i, (msg) ->
    words = robot.brain.data["subscribed_words"]
    message = "People are listening for:\n"
    for word in words
      amount = robot.brain.data["subscriptions_" + word].length
      if amount > 0
        message += "'" + word + "' - " + amount
        if amount > 1
          message += " people listening\n"
        else
          message += " person listening\n"
    msg.send message
