# Description:
#   Tells Brehm to listen for a word for the user/room
#
# Commands:
#   hubot listen for <word> - Be notified when a word is mentioned in any room
#   hubot stop listening for <word> - Stop being notified when a word is mentioned in any room 
#   hubot what are people listening for - Displays a list of words people are listening for 

_ = require('underscore')

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
      return -1 if @myRobot.brain.data[sub_word] is `undefined`
      if msg.message.user.room is `undefined`
        index = @myRobot.brain.data[sub_word].indexOf(msg.message.user["jid"])
      else
        index = @myRobot.brain.data[sub_word].indexOf(msg.message.user["reply_to"])
      @myRobot.brain.data[sub_word].splice(index, 1) if index != -1
      return index

    send: (msg, str) ->
      if msg.message.user.room is `undefined`
        jid = msg.message.user["jid"]
      else
        jid = msg.message.user["reply_to"]
      @myRobot.send jid, str
     

module.exports = (robot) ->

  listener = new Listener(robot)

  robot.respond /stop listening (to|for) (.*)/i, (msg) ->
    index = listener.unsubscribe msg
    if index != -1
      listener.send msg, "I am no longer listening for '" + msg.match[2] + "' for you."
    else
      listener.send msg, "I was never listening for '" + msg.match[2] + "' for you. Type '@Brehmbot listen for " + msg.match[2] + "' to listen."

  robot.respond /stop listening all/i, (msg) ->
    subscribed_words = robot.brain.data["subscribed_words"]
    for word in subscribed_words
      if msg.message.user.room is `undefined`
        index = robot.brain.data["subscriptions_" + word].indexOf(msg.message.user["jid"])
      else
        index = robot.brain.data["subscriptions_" + word].indexOf(msg.message.user["reply_to"])
      unless index is -1
        robot.brain.data["subscriptions_" + word].splice(index, 1)
        listener.send msg, "I am no longer listening for '" + word + "' for you."

  robot.hear /.*/i, (msg) ->
    return if msg.message.user.room is `undefined`
    subscribed_words = robot.brain.data["subscribed_words"]
    phrase = msg.match[0]
    filtered_phrase = msg.match[0]
    while filtered_phrase.indexOf("@") != -1 # Super jank
      filtered_phrase = filtered_phrase.replace("@", "[at]") # Super jank
    for word in subscribed_words
      unless phrase.toLowerCase().indexOf(word) is -1
        people = robot.brain.data["subscriptions_" + word]
        for person in people
          #continue if person.indexOf("conf.hipchat.com") != -1 and robot.brain.data["allowed_rooms"].indexOf(person) is -1
          robot.send person, msg.message.user.name + " said '" + word + "' in room '" + msg.message.user.room + "': \"" + filtered_phrase + "\"" unless msg.message.user["reply_to"] is person

  robot.respond /listen (to|for) (.*)/i, (msg) ->
    msg.match[2] = msg.match[2].trim()
    return if msg.match[2].length == 0
    added = listener.subscribe msg
    if added
      listener.send msg, "I'll let you know when '" + msg.match[2] + "' is said in a room"
    else
      listener.send msg, "I am already listening for '" + msg.match[2] + "' for you."
    
  robot.respond /what are people listening for/i, (msg) ->
    words = _.sortBy robot.brain.data["subscribed_words"], (key) ->
      robot.brain.data["subscriptions_" + word].length * -1

    message = "People are listening for:\n"
    for word in words
      amount = robot.brain.data["subscriptions_" + word].length
      if amount > 0
        message += "'" + word + "' - " + amount
        if amount > 1
          message += " people listening\n"
        else
          message += " person listening\n"
    listener.send msg, message
