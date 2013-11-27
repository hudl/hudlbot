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
#   it's a trap - Display an Admiral Ackbar piece of wonder
#
# Author:
#   brilliantfantastic

ackbars = [
  "http://dayofthejedi.com/wp-content/uploads/2011/03/171.jpg",
  "http://dayofthejedi.com/wp-content/uploads/2011/03/152.jpg",
  "http://farm4.static.flickr.com/3572/3637082894_e23313f6fb_o.jpg",
  "http://6.asset.soup.io/asset/0610/8774_242b_500.jpeg",
  "http://files.g4tv.com/ImageDb3/279875_S/steampunk-ackbar.jpg",
  "http://farm6.static.flickr.com/5291/5542027315_ba79daabfb.jpg",
  "http://farm5.staticflickr.com/4074/4751546688_5c76b0e308_z.jpg",
  "https://i.chzbgr.com/maxW500/4930876416/hB0F640C6/",
  "http://24.media.tumblr.com/e4255aa10151ebddf57555dfa3fc8779/tumblr_mho9v9y5hE1r8gxxfo1_500.jpg",
  "http://farm2.staticflickr.com/1440/5170210261_fddb4c480c_z.jpg"
]

module.exports = (robot) ->
  robot.hear /trap/i, (msg) ->
    msg.send msg.random ackbars
