#!/bin/sh

git_move() {
    if [ "$1" != "$2" ]; then
        echo "MOVE $1 -> $2";
        git mv $1 $2
    else
        :
        # echo "NOOP $1 == $2";
    fi
}

root=./fiches

pn=0 # Path number
fn=0 # File number
for path in $root/[0-9]*; do
    pn=$(($pn+10))
    folder=`basename $path`
    git_move $path $root/`printf %02d-%s ${pn} ${folder#*-}`
    for file in $path/[0-9]*.tex;  do
        fn=$(($fn+10))
        filename=`basename $file`
        git_move $file $path/`printf %03d-%s ${fn} ${filename#*-}`
    done
done
