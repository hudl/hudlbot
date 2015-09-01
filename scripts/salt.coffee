# Description:
#   Displays a picture of salt when necessary
#

module.exports = (robot) ->

  robot.respond /salt/i, (msg) ->
    return unless msg.message.room in ["dev_interns", "super_smash_brothers"]
    msg.send "https://s3.amazonaws.com/hudl-internal-assets/salt_big.png"
    
