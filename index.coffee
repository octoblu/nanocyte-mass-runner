_      = require 'lodash'
Runner = require './runner'
debug  = require('debug')('nanocyte-mass-runner:index')

runner = new Runner

runAndRun = =>
  debug 'running now'
  callback = =>
    randomNumber = Math.round(Math.random() * 100)
    debug "running again in #{randomNumber}"
    _.delay runner.run, randomNumber, callback
  runner.run callback

_.times 5, runAndRun

setInterval runner.clickAllTriggers, 5 * 1000
