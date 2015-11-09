#!/bin/sh

root=./contents

if [ "$4" == "" ]; then
    echo "Usage: $0 chapter number id Title"
    exit -1;
fi

path=`find $root -type d -name $(printf "%02d" $1)*`
if [ -z $path ]; then
    echo "No such chapter: $1."
    exit -1
fi

fn="$path/"`printf "%03d" $2`"-$3.md"

if [ -e $fn ]; then
    echo "File exists: $fn"
    exit -1
fi

echo "---\ntitle: $4\nid: $3\n---\n" > $fn
git add $fn
$EDITOR $fn
