# Description:
#   Rodent Motivation
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   ship it - Display a motivation squirrel
#   shipped it - Display a success squirrel/velociraptor
#   dont ship - Display a fail message

module.exports = (robot) ->
  robot.hear /ship it|shipping/i, (msg) ->
    msg.send msg.random shipit

  robot.hear /shipped/i, (msg) ->
    msg.send msg.random shippedit

  robot.hear /dont ship/i, (msg) ->
    msg.send msg.random dontship

shipit = [
  "https://img.skitch.com/20111026-r2wsngtu4jftwxmsytdke6arwd.png",
  "http://images.cheezburger.com/completestore/2011/11/2/aa83c0c4-2123-4bd3-8097-966c9461b30c.jpg",
  "http://images.cheezburger.com/completestore/2011/11/2/46e81db3-bead-4e2e-a157-8edd0339192f.jpg",
  "http://gifs.gifbin.com/092010/1285616410_ship-launch-floods-street.gif",
  "http://d2f8dzk2mhcqts.cloudfront.net/0772_PEW_Roundup/09_Squirrel.jpg",
  "http://www.cybersalt.org/images/funnypictures/s/supersquirrel.jpg",
  "https://dl.dropboxusercontent.com/u/602885/github/sniper-squirrel.jpg",
  "http://1.bp.blogspot.com/_v0neUj-VDa4/TFBEbqFQcII/AAAAAAAAFBU/E8kPNmF1h1E/s640/squirrelbacca-thumb.jpg",
  "http://media.tumblr.com/tumblr_m5h32oA5if1qg9f9k.gif",
  "http://www.gxjansen.com/images/ship.gif",
  "http://media.tumblr.com/34507ef6528f17f3892e34153bfe35b0/tumblr_inline_mlappj59TB1qz4rgp.gif",
  "http://f.cl.ly/items/0c0M1o3I1V1P2Y0S1a2D/aItp6.gif"
]

shippedit = [
  "http://images.cheezburger.com/completestore/2010/4/14/129157560493033650.gif",
  "http://i.imgur.com/4B3ih.jpg",
]

dontship = [
  "https://i.chzbgr.com/maxW500/7583913984/h4150A893/",
]