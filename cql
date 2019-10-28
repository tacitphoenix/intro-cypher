#!/bin/bash

# load variables
. ./.env

# run cypher script using cypher shell
cat $1|$CYSH -u $USER -p $PASS --format verbose > ./output

# display output from cypher script
cat ./output

