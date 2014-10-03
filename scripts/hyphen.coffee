# Author:
#   Keaton Greve (keaton.greve)

module.exports = (robot) ->
  robot.hear /\s*(.*)[\s+|-]ass\s+(.*)/i, (msg) ->
    return unless msg.message.room is "inner_cirlce_ms"
    if matches? and matches.length == 3
      msg.send "Ha, more like: #{matches[1]} ass-#{matches[2]}"
