rooms = [
    "Agassi - https://gotomeet.me/hudlagassi",
    "All Hands - http://gotomeet.me/HudlTheGreatOne",
    "Babe - https://plus.google.com/hangouts/_/event/cbns1f8su56mbots08p5qjbarqo",
    "Billie Jean - https://gotomeet.me/hudlbilliejean/",
    "Bird - https://plus.google.com/hangouts/_/event/chlbnrdt4173hvf9430hs43fjvg",
    "Bits - https://meet.lync.com/agilesports/ryan.versaw/6C31G19M",
    "Bo Jackson - http://gotomeet.me/HudlBoJackson",
    "Bolt - https://plus.google.com/hangouts/_/event/c8lmc79519acl24llvdkm15r7cs",
    "Ops - https://plus.google.com/hangouts/_/calendar/bGV2aUBsZXZpbmVsc29uLmNvbQ.9bamlh6vql0acj6fe22alnf8o8",
    "Flo Jo - https://plus.google.com/hangouts/_/event/ckq77qu9k8a1en3ag07b5c1u0ak",
    "Gordie - http://gotomeet.me/HudlGordie",
    "Great One - http://gotomeet.me/HudlTheGreatOne",
    "Jackie - https://plus.google.com/hangouts/_/calendar/amFyZWRzdGF1ZmZlcjFAZ21haWwuY29t.djaqub21u372bae8md0j5qiiqk",
    "Leroy - https://plus.google.com/hangouts/_/event/cc2dupjr324ef2f0n26eue2m7to",
    "Magic - https://plus.google.com/hangouts/_/event/c5sb82jgh3lbb875nadi6ns5nmk",
    "MJ - https://plus.google.com/hangouts/_/calendar/amFyZWRzdGF1ZmZlcjFAZ21haWwuY29t.44b9ra1rvhr288ukudvr3g7lko",
    "Mobile - https://plus.google.com/hangouts/_/event/c0bs2noud5524u99gfbghq428qs",
    "Murph - https://plus.google.com/hangouts/_/event/cm8g43gp4at556ip7itcuornobc",
    "DG - https://plus.google.com/hangouts/_/calendar/YnJpYW4ua2Fpc2VyQGdtYWlsLmNvbQ.0f4np3fnn2b158q84rraj5dgao",
    "Pele - https://plus.google.com/hangouts/_/event/c3j95fadmh4kv8i6u1slfvrllho",
    "Peyton - https://plus.google.com/hangouts/_/calendar/amFyZWRzdGF1ZmZlcjFAZ21haWwuY29t.vei5s0te6q00easqup7dd9pij8",
    "Pre - https://plus.google.com/hangouts/_/event/cdddfj6bkfcif43udk05i3hkme0",
    "Serena - https://plus.google.com/hangouts/_/calendar/amFyZWRzdGF1ZmZlcjFAZ21haWwuY29t.8gkn9b28d7uo78ctha0reoo4mk",
    "Sir Charles - https://plus.google.com/hangouts/_/event/c3tbk26pjs1v5mgmvp6cqt0gc3c",
    "Axp - http://bit.ly/HuddleAXP"
]


module.exports = (robot) ->

  robot.respond /find room in (east|west)/i, (msg) ->
    msg.send "Checking for rooms in " + msg.match[1] + ", 1 sec..."
    robot.http("http://calendars/api/roomlist/hudl" + msg.match[1] + "@hudl.com/availability")
      .get() (err, res, body) ->
        rooms = JSON.parse(body)
        for room in rooms
          msg.send room.Name

   robot.respond /room link me(.*)/i, (msg) ->
     if msg.match[1].length > 1
       msg.match[1] = msg.match[1].trim()
       found = false
     for room in rooms
       if msg.match[1].length == 0
         msg.send room
       else if msg.match[1].length > 0 and (msg.match[1].toLowerCase() is room.split("-")[0].trim().toLowerCase())
         msg.send room
         found = true
     if found is false
       msg.send "Could not find a link for room '" + msg.match[1] + "'." 
