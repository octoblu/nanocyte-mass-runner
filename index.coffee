_      = require 'lodash'
Runner = require './runner'

runner = new Runner
runner.clickAllTriggers()

setInterval runner.clickAllTriggers, 25 * 1000
