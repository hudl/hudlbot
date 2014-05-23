# Description:
# 	Shows a haha, business image when anybody says business.

module.exports = (robot) ->
	robot.hear /business/i, (msg) ->
		msg.send "http://img.picsgen.com/wp-content/uploads/2013/04/haha-business.jpg"