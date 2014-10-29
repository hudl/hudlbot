# Description:
#	When prompted, this script shows alot to the room
#
# Author:
#	Mike Jensen

alot = [
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT2.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT3.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT4.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT5.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT6.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT8.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT9.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT12.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT13.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT14.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/ALOT15.png"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/i_dont_want_alot_for_christmas___alot_meme_by_britishbrunette-d4jdvho.jpg"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/1395173798486.jpg"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/i_like_this_alot__by_loveandasandwich-d301stf.jpg"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/D0HkOzo.jpg"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/G6ggO.jpg"
  "https://s3.amazonaws.com/hudl-internal-assets/alot/i__m_sad__alot_by_celestialbeast-d3f0uv1.jpg"]

module.exports = (robot) ->
  robot.hear /alot/i, (msg) ->
    msg.send msg.random alot
