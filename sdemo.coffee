# Messing around with services demo
#
# events <2011-9> - Returns random event for a given month

module.exports = (robot) ->
  robot.respond /events/i, (msg) ->
    params["source"] = msg.match[1].split(/\s+/).join("+")  if msg.match[1]
    msg.http("http://sdemo/api/events.json").get() (err, res, body) ->
      response = undefined
      count = body.length
      response = body
      msg.send response