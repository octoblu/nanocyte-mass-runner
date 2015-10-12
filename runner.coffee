FlowMaster    = require './flow-master'
MeshbluConfig = require 'meshblu-config'
debug         = require('debug')('nanocyte-mass-runner:index')

class Runner
  constructor: ->
    meshbluConfig = new MeshbluConfig
    meshbluConfigJSON = meshbluConfig.toJSON()

    @options =
      uuid: meshbluConfigJSON.uuid
      token: meshbluConfigJSON.token
      meshbluServer: meshbluConfigJSON.server
      meshbluPort: meshbluConfigJSON.port
      octobluServer: process.env.OCTOBLU_SERVER
      octobluPort: process.env.OCTOBLU_PORT
      nanocyteServer: process.env.NANOCYTE_SERVER
      nanocytePort: process.env.NANOCYTE_PORT
    debug 'options', @options

  deployAndClick: =>
    flowJSON = require './meshblu.json'
    flowId = flowJSON.uuid
    triggerId = flowJSON.triggerId
    master = new FlowMaster @options
    master.deploy flowId, (error) =>
      return console.error 'error deploying flow', error if error?
      setTimeout =>
        master.clickTrigger flowId, triggerId, (error, response) =>
          return console.error error if error?
          debug 'clicked trigger'
      , 1000

  clickAllTriggers: =>
    master = new FlowMaster @options
    master.clickAllTriggers()

  run: (callback=->)=>
    master = new FlowMaster @options
    master.create (error, flow) =>
      return console.error 'error creating demo flow', error if error?
      triggerId = master.findTriggerId flow
      flowId = flow.flowId
      debug 'created demo flow'
      master.deploy flowId, (error) =>
        return console.error 'error deploying flow', error if error?
        master.clickTrigger flowId, triggerId, (error, response) =>
          return console.error error if error?
          debug 'clicked trigger'
          callback()

module.exports = Runner
