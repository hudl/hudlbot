
# Description:
#   Gives the user a gold star for trying
#
# Author:
#   Mike Jensen

module.exports = (robot) ->
        robot.hear /.*you tried.*/i, (msg) ->
          msg.send "https://laurenburgueno.files.wordpress.com/2012/10/060.png"
