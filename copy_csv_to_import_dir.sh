#!/bin/bash

# display import directory
./cql scripts/common/get_import_dir.cql

# set import directory to variable
NEO4J_IMPORT_DIR=`grep -o '/.*t' ./output`

# copy csv file in data directory to neo4j import directory
cp ./data/* "$NEO4J_IMPORT_DIR" 
#echo $NEO4J_IMPORT_DIR 


