#!/bin/bash

set -u          # This will cause the script to exit if an uninitialised variable is used               

x=10
Y=20
Z=$((X + Y + W))
echo "Z equals: $Z"

