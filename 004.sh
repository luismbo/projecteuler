#!/bin/bash

palindromic() {
    rev=$(echo "$1" | rev)
    [ "$rev" = "$1" ]
    return $?
}

MIN=100
MAX=999

best=0

for ((i = MIN; i <= MAX; i++)); do
    for ((j = i; j <= MAX; j++)); do
        let p=i*j
        if [ $p -gt $best ] && palindromic $p; then
            best=$p
        fi
    done
done

echo $best
