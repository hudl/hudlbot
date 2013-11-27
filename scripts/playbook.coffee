# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   playbook - Display T-Magic and his thoughts on the subject
#
# Author:
#   munger

module.exports = (robot) ->
  robot.hear /playbook/i, (msg) ->
    msg.send "http://i.imgur.com/YzLvRtF.jpg"