#!/bin/bash
echo "The $0 script got the argument: $1"
echo "Argument 2 is $2"

for i in "$@"
do
    echo $i
done

echo "There were $# arguments."
