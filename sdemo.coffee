module.exports = (robot) ->
  robot.respond /events/i, (msg) ->
    params["source"] = msg.match[1].split(/\s+/).join("+")  if msg.match[1]
    msg.http("http://sdemo/api/events").get() (err, res, body) ->
      msg.send body