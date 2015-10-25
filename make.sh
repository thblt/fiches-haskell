#!/bin/sh

out="fiches/_everything.tex"

# We add a "\ " after each \input, so that TeX opens a new page even if the
# previous file ends in a \[sub[sub]]section with no contents.
if [ -z $1 ]; then
    ls fiches/**/[0-9]*.tex | xargs -I X echo "\input{X}\ " > $out
else
    rm $out
    for i in $@; do
        ls fiches/**/`printf %03d $i`*.tex | xargs -I X echo "\input{X}\ " >> $out
    done
fi

if xelatex --shell-escape master
    then
    if biber master
        then
        if xelatex --shell-escape -interaction=nonstopmode master
            then
            xelatex --shell-escape -interaction=nonstopmode master
        fi
    fi
fi
exit -1
