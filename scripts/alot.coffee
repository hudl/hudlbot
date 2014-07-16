# Description:
#	When prompted, this script shows alot to the room
#
# Author:
#	Mike Jensen

alot = [
  "http://4.bp.blogspot.com/_D_Z-D2tzi14/S8TRIo4br3I/AAAAAAAACv4/Zh7_GcMlRKo/s400/ALOT.png"
, "http://3.bp.blogspot.com/_D_Z-D2tzi14/S8TTPQCPA6I/AAAAAAAACwA/ZHZH-Bi8OmI/s400/ALOT2.png"
, "http://3.bp.blogspot.com/_D_Z-D2tzi14/S8TWUJ0APWI/AAAAAAAACwI/014KRxexoQ0/s320/ALOT3.png"
, "http://2.bp.blogspot.com/_D_Z-D2tzi14/S8Tdnn-NE0I/AAAAAAAACww/khYjZePN50Y/s400/ALOT4.png"
, "http://4.bp.blogspot.com/_D_Z-D2tzi14/S8TfVzrqKDI/AAAAAAAACw4/AaBFBmKK3SA/s320/ALOT5.png"
, "http://3.bp.blogspot.com/_D_Z-D2tzi14/S8TffVGLElI/AAAAAAAACxA/trH1ch0Y3tI/s320/ALOT6.png"
, "http://3.bp.blogspot.com/_D_Z-D2tzi14/S8TW0Y2bL_I/AAAAAAAACwY/MGdywFA2tbg/s320/ALOT8.png"
, "http://3.bp.blogspot.com/_D_Z-D2tzi14/S8TWtWhXOfI/AAAAAAAACwQ/vCeUMPnMXno/s320/ALOT9.png"
, "http://1.bp.blogspot.com/_D_Z-D2tzi14/S8TflwXvTgI/AAAAAAAACxI/qgd1wYcTWV8/s320/ALOT12.png"
, "http://1.bp.blogspot.com/_D_Z-D2tzi14/S8TZcKXqR-I/AAAAAAAACwg/F7AqxDrPjhg/s320/ALOT13.png"
, "http://2.bp.blogspot.com/_D_Z-D2tzi14/S8TiTtIFjpI/AAAAAAAACxQ/HXLdiZZ0goU/s1600/ALOT14.png"
, "http://1.bp.blogspot.com/_D_Z-D2tzi14/S8TpGRlt9eI/AAAAAAAACxY/qDqk63PhqGs/s400/ALOT15.png"
, "http://th01.deviantart.net/fs70/200H/f/2011/351/f/d/i_dont_want_alot_for_christmas___alot_meme_by_britishbrunette-d4jdvho.jpg"
, "http://img.4plebs.org/boards/tg/image/1395/17/1395173798486.jpg"
, "http://fc09.deviantart.net/fs71/f/2010/277/d/4/i_like_this_alot__by_loveandasandwich-d301stf.jpg"
, "http://imgur.com/D0HkOzo.jpg"
, "http://i.imgur.com/G6ggO.jpg"
, "http://fc02.deviantart.net/fs71/f/2011/117/a/6/i__m_sad__alot_by_celestialbeast-d3f0uv1.jpg"]

#Links will need to be interalized.

module.exports = (robot) ->
  robot.hear /alot/i, msg ->
    msg.send msg.random alot