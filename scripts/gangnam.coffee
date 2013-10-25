# Gangnam
#
# Blame Clymer1 for this.

module.exports = (robot) ->
  robot.hear /.*Oppan.*/i, (msg) ->
    msg.send "Gangnam Style (gangnamstyle)"
