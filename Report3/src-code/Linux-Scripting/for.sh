#!/bin/sh

# Loop test 1
echo "Loop test 1"
for i in 1 2 3 4 5
do
  echo "Looping ... number $i"
done

# Loop test 2
echo "Loop test 2"
for i in hello 1 * 2 goodbye # The * is a wildcard and will print the name of the files in the current directory
do
  echo "Looping ... i is set to $i"
done
