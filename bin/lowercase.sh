#!/bin/sh

# Change a list of file names to lowercase
#
# Example:
#
# lowercase UPPercase.PNG
# => uppercase.png

for i in *
do
  j=`echo $i | tr '[A-Z]' '[a-z]'`
  mv $i $j
done
