#!/bin/sh
i=0
for fn in fiches/[0-9]*.tex; do
    git mv $fn fiches/`printf %03d-%s ${i} ${fn#*-}`
    i=$(($i+10))
done
