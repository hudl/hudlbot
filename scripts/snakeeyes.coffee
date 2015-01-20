# snakeeyes is back ... and this time it's personal!

module.exports = (robot) ->
  robot.hear /snakeeyes/i, (msg) ->
    msg.send "https://s3.amazonaws.com/uploads.hipchat.com/22870/1283605/G8alpYjDPh6EdDO/upload.png"
