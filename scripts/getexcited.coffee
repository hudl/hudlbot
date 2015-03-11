# Description:
# 	Shows a really excited jello head when anybody says business.

module.exports = (robot) ->
  robot.hear /get excited/i, (msg) ->
    msg.send "http://media4.giphy.com/media/C37EWxtBvbacU/giphy.gif"
