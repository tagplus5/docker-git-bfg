#!/bin/bash

BASEDIR=`dirname "$0"`
FULLPATH=`cd "$BASEDIR"; pwd`
cd $FULLPATH

docker build --pull --force-rm --tag=tagplus5/git-bfg .
