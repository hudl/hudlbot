# Description:
# 	Shows Ron Paul's 'It's Happening' whenever somebody says 'happening.'

module.exports = (robot) ->
	robot.hear /happening/i, (msg) ->
		msg.send "https://img.4plebs.org/boards/pol/image/1385/75/1385753810661.gif"