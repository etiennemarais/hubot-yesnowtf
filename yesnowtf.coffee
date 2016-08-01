# Description:
#   Wraps the yesnowtf api and returns the response as a slack message.
#
# Dependencies:
#   "coffee-script": "^1.9.0"
#
# Configuration:
#   None
#
# Commands:
#   Ask a question - gives very scientific answer
#
# Notes
#   See questions array for list of triggers.
#
# Author:
#   Etienne Marais <hello@etiennemarais.co.za>

triggers = require './data/triggers.json'
regex = new RegExp triggers.join('|'), 'gi'

module.exports = (robot) ->
    robot.respond regex, (msg) ->
        msg.http("https://yesno.wtf/api").get() (err, res, body) ->
            data = JSON.parse body
            msg.send("*" + data.answer + "* : " + data.image)
