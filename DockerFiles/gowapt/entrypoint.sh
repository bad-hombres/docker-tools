#!/bin/bash

if [ "$1" == "" ]; then
  bash -i
else
  gowapt $@
fi
