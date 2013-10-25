# BING!
#
# hubot bing me <query>   - Bing and enjoy.

module.exports = (robot) ->
  robot.respond /(bing)( me)? (.*)/i, (msg) ->
    msg.send "http://www.youtube.com/watch?v=SPbijgSYe_4"
