# Description:
#   Hears the phrase "what does X stand for?" and looks up the abbreviation
#
# Configuration:
#	You need to set the following variables:
#	HUBOT_STANDS4_ID = <user_id>
#	HUBOT_STANDS4_TOKEN = <api_token>
#   
xml2js = require('xml2js');

module.exports = (robot) ->
	robot.hear /what does ([a-zA-Z0-9]+) stand for\?/i, (msg) ->
		msg
			.http("http://www.stands4.com/services/v2/abbr.php")
			.query
				uid: process.env.HUBOT_STANDS4_ID
				tokenid: process.env.HUBOT_STANDS4_TOKEN
				term: msg.match[1]