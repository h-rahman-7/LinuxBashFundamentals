#!/bin/bash

compare_checksums() {
    local checksum1="$1"
    local checksum2="$2"

    if [[ $checksum1 == $checksum2 ]]; then
        echo "Checksums match. File is intact."
    else
        echo "Checksums do not match. File is integrity is compromised."
    fi
}

compare_checksums "123" "1234"