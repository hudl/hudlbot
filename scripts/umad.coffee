# Description:
#   Is someone mad?
#
# Author:
#   Brendan Smith

module.exports = (robot) ->
  robot.respond /(you|u) mad\b/i, (msg) ->
    msg.send "https://s3.amazonaws.com/hudl-internal-assets/u-mad1.jpg"

