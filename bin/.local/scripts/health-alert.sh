#!/bin/bash

counter=0
total=20

while sleep 1200; do
    counter=$((counter+1))
    dunstify Health "$counter/$total Hydrate, stretch, bilnk eyes, and walk around" -u critical
done
