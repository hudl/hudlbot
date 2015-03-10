# Description:
#   Is someone mad?
#
# Author:
#   Brendan Smith

module.exports = (robot) ->
  robot.hear /(you|u) mad\b/i, (msg) ->
    msg.respond "https://s3.amazonaws.com/hudl-internal-assets/u-mad1.jpg"

