#!/bin/bash

length="$1"
width="$2"

area=$((length * width))
perimeter=$((2 * (length + width))

echo "The area of the retangle is: $area"
echo "The perimeter of the rectangle is: $perimeter"