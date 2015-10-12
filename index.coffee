_      = require 'lodash'
Runner = require './runner'

runner = new Runner

runner.run =>
  _.delay runner.run, 1000
setInterval runner.clickAllTriggers, 10 * 1000
