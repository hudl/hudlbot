# Description:
# 	Shows a haha, business image when anybody says business.

module.exports = (robot) ->
  robot.respond /business/i, (msg) ->
    msg.send "https://s3.amazonaws.com/hudl-internal-assets/haha-business.jpg"
