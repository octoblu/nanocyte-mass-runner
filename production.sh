#!/bin/bash

MESHBLU_SERVER='52.89.153.115'
MESHBLU_PORT="80"
MESHBLU_UUID="75bfd3bc-8f13-441d-8dbd-b189f7bdca2a"
MESHBLU_TOKEN="9483d7832d9099d01909924a7679ac2265f31f2c"
OCTOBLU_SERVER="app.octoblu.com"
OCTOBLU_PORT="80"
NANOCYTE_SERVER='nanocyte-flow-deploy.octoblu.com'
NANOCYTE_PORT="80"
DEBUG="nanocyte-mass-runner:*"
export MESHBLU_SERVER MESHBLU_PORT MESHBLU_UUID MESHBLU_TOKEN OCTOBLU_SERVER OCTOBLU_PORT DEBUG NODE_DEBUG NANOCYTE_SERVER NANOCYTE_PORT

npm start