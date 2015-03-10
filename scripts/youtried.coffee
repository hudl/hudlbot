
# Description:
#   Gives the user a gold star for trying
#
# Author:
#   Mike Jensen

module.exports = (robot) ->
  robot.respond /.*you tried.*/i, (msg) ->
    msg.send "https://s3.amazonaws.com/hudl-internal-assets/060.png"
