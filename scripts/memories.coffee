# Description:
# Brehm remembers key-value pairs
#
# Commands:
#   remember <memory> is <some phrase, link, whatever> - Creates a memory
#   recall <memory> - Prints the memory
#   memories - List all memories
#   forget <memories> - delete a memory
#   favorite memories - list most recalled memories
#
# Author:
#   Brendan Smith, brendan.smith@hudl.com

_ = require('underscore')

class MemoryBot

  constructor: (@robot) ->
    @memories = () -> robot.brain.data.remember ?= {}
    @recollections = () -> robot.brain.data.recollections ?= {}

  add: (key, val) ->
    if this.get key
      "I already remember #{key} as #{val}"
    else
      this.set key, val

  append: (key, val) ->
    if this.get key
      this.set key, this.get(key) + "\n" + val
      "OK. I'll remember that #{key} is also #{val}"
    else
      "I have no memory of #{key}"

  set: (key, val) ->
    if similar = this.findSimilarMemory key
      @memories()[similar] = val
    else
      @memories()[key] = val
    "OK. I'll remember that #{key} is #{val}"

  del: (key) ->
    delete @memories()[key]
    # should we delete recollections? 
    "OK. I forgot about #{key}"

  get: (key) ->
    similar = this.findSimilarMemory(key) || key

    memory = @memories()[similar]
    if memory
      @recollections()[similar] ?= 0
      @recollections()[similar]++
    return memory

  list: ->
    Object.keys(@memories())

  listFavorites: ->
    rec = @recollections() # not sure how to bind sort lambda, this works
    sortedMemories = _.sortBy Object.keys(@recollections()), (key) ->
      rec[key]

    sortedMemories.reverse()
    return sortedMemories

  findSimilarMemory: (key) ->
    searchRegex = new RegExp(key, 'i')
    similars = Object.keys(@memories()).filter (key) -> searchRegex.test(key)

    similars[0]

  handleRemember: (text) ->
    if match = /remember(?: that)? (.+?)\ (?:is|are) also (.+)/i.exec text
      this.append match[1], match[2]
    else if match = /remember(?: that)? (.+?) (?:is|are) (.+)/i.exec text
      this.add match[1], match[2]
    else
      match = /remember(?: that)? (.+)/.exec text
      if val = this.get(match[1])
        "I already remember #{match[1]} as #{val}"
      else
        "What should I remember about #{match[1]}?"

  handleRecall: (text) ->
    match = /recall (.+)/i.exec text

    val = this.get match[1]

    if !val
      return "I have no memory of #{match[1]}"

    if /\n/.test(val)
      match[1] + ":\n" + val
    else
      match[1] + " is " + val
      

module.exports = (robot) ->
  memoryBot = new MemoryBot robot

  robot.respond /remember (.+)/i, (msg) ->
    msg.send memoryBot.handleRemember msg.message.text

  robot.respond /recall (.+)/i, (msg) ->
    msg.send memoryBot.handleRecall msg.message.text

  robot.respond /what do you remember|memories/i, (msg) ->
    msg.send memoryBot.list().join('\n')

  robot.respond /forget (.*)$/i, (msg) ->
    msg.send memoryBot.del msg.match[1]

  robot.respond /(what are your )?favorite memories/i, (msg) ->
    favorites = memoryBot.listFavorites()[0..10].join('\n')
    msg.send "My favorite memories are:\n#{favorites}"

