#!/bin/bash

export HOST='vdi-rh-21'

curl -kvvv  https://${HOST}/who --cacert rootCA.crt --cert genCerts/fredFlintstone.crt --key certs/fredFlintstone.key 
