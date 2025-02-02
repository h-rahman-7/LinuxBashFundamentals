#!/bin/bash

set -o pipefail  # This will cause the script to exit if any command in a pipeline fails

cat nonexsistentfile | grep "something"