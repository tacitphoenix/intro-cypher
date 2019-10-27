#!/bin/bash

. ./.env
CYSH=./cysh

cat $1|$CYSH -u $USER -p $PASS

