ls fiches | grep "^[[:digit:]]" | xargs -I X echo "\input{fiches/X}" > fiches/_everything.tex
if xelatex --shell-escape master
    then
    if biber master
        then
        if xelatex -interaction=nonstopmode master
            then
            xelatex -interaction=nonstopmode master
        fi
    fi
fi
