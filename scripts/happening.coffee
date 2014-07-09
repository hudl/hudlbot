# Description:
# 	Shows Ron Paul's 'It's Happening' whenever somebody says 'happening.'

module.exports = (robot) ->
	robot.hear /happening/i, (msg) ->
		msg.send "https://s3.amazonaws.com/hudl-internal-assets/1385753810661.gif"
