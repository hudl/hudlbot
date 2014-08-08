# Description:
#   Is someone mad?
#
# Author:
#   Brendan Smith

module.exports = (robot) ->
  robot.hear /(you|u) mad/i, (msg) ->
    msg.send "https://s3.amazonaws.com/hudl-internal-assets/u-mad1.jpg"

