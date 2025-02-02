#!/bin/bash

get_file_count() {
    local directory=$1
    local file_count

    file_count=$(ls "$directory" | wc -l)

    echo "Number of fies in $directory: $file_count"
}

get_file_count "./"