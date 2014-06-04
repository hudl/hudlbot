# Description:
#   Find the latest Bitcoin price in specified currency
#
# Dependencies:
#   "cheerio": ""
#
# Configuration:
#   None
#
# Commands:
#   hubot bitcoin price (in) <currency>
#
# Author:
#   Fred Wu

cheerio = require('cheerio')

module.exports = (robot) ->
  robot.respond /bitcoin price/i, (msg) ->
    bitcoinPrice(msg)

bitcoinPrice = (msg) ->
  msg
    .send "Looking up... sit tight..."
  msg
    .http("http://bitcoinprices.com/")
    .get() (err, res, body) ->
      msg.send "#{getPrice(body)}"

getPrice = (body) ->
  $ = cheerio.load(body)

  lastPrice   = null
  highPrice   = null
  lowPrice    = null
  priceSymbol = null

  $('table.currencies td.symbol').each (i) ->
    if $(this).text() == "USD"
      priceSymbol = $(this).next().next().next().next().next().next().text()
      lastPrice = "#{priceSymbol}#{$(this).next().next().next().next().next().text()}"
      highPrice = "#{priceSymbol}#{$(this).next().next().next().text()}"
      lowPrice  = "#{priceSymbol}#{$(this).next().next().next().next().text()}"
      false

  if lastPrice == null
    "Can't find the price. :("
  else
    "#{lastPrice} (H: #{highPrice} | L: #{lowPrice})"
