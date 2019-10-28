#!/bin/bash

# load variables
. ./.env

cat $1|$CYSH -u $USER -p $PASS

