ls fiches | grep "^[[:digit:]]" | xargs -I X echo "\input{fiches/X}" > fiches/_everything.tex
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
