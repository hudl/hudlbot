# Thanks
#
# Brehm appreciates your thanks

module.exports = (robot) ->
  robot.respond /thank.*brehm| brehm.*thank/i, (msg) ->
    msg.send "I appreciate your appreciation #{msg.message.user.name}"
