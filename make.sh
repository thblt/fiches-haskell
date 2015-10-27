#!/bin/sh

out="fiches/_everything.tex"
rm $out

# We add a "\ " after each \input, so that TeX opens a new page even if the
# previous file ends in a \[sub[sub]]section with no contents.
if [ -z $1 ]; then
    for path in ./fiches/[0-9]*; do
        heading=$path/part.tex
        if [ -e $heading ]; then
            printf "\input{$heading}\\ \n\n" >> $out
        fi
        ls $path/[0-9]*.tex | xargs -I X printf "\\\\input{X}\\\\ \n\n" >> $out
    done
else
    rm $out
    for i in $@; do
        ls fiches/**/`printf %03d $i`*.tex | xargs -I X printf "\\\\input{X}\\\\ \n\n" >> $out
    done
fi

if xelatex --shell-escape master
    then
    if biber master
        then
        if xelatex --shell-escape -interaction=nonstopmode master
            then
            xelatex --shell-escape --synctex=1 -interaction=nonstopmode master
        fi
    fi
fi
exit -1
