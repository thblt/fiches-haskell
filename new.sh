#!/bin/sh

if [ "$3" == "" ]; then
    echo "Usage: $0 num id Titre"
    exit -1;
fi

fn="fiches/"`printf "%03d" $1`"-$2.tex"

if [ -e $fn ]; then
    echo "File exists: $fn"
    exit -1
fi
echo $fn
echo "\\section{$3}\n\\label{$2}\n" > $fn
git add $fn
$EDITOR $fn
