# Game of Thrones spoilers are the worst
#
# Sheets

module.exports = (robot) ->
  robot.respond /game of thrones/i, (message) ->
    message.send "http://img1.wikia.nocookie.net/__cb20110710172126/gameofthrones/images/e/e5/Spoilers.gif"
