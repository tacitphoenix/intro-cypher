#!/bin/bash

CYPHER_SHELL_URL=https://github.com/neo4j/cypher-shell/releases/download/1.1.12/cypher-shell.zip
CYPHER_ZIP_FILE=./cypher-shell.zip
CYPHER_DIR=./cypher

# get cypher shell
if [[ ! -f "$CYPHER_ZIP_FILE" ]]; then
  wget $CYPHER_SHELL_URL
fi

# create cypher directory
if [[ ! -d "$CYPHER_DIR" ]]; then
  unzip ./cypher-shell.zip -d cypher
fi

