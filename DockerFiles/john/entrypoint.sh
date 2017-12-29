#!/bin/bash

if [[ "$1" == "" ]]; then
  bash -i
else
  /root/src/john/run/john $@
fi
