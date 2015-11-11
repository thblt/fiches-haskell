---
title: Évaluation paresseuse
id: lazyness
---

\haskell
let a = [1..] -- a est la liste de l'ensemble des entiers positifs
let b = map ((^^) 2) a
\eof

L'évaluation paresseuse a un prix, qui est une plus grande consommation de mémoire : au lieu d'évaluer \hs{2 + 2}, Haskell stocke un \gls{thunk}, c'est à dire en gros un calcul différé. Mais sur les gros traitements récursifs, l'accumulation de \glspl{thunk} peut entrainer rapidement un débordement de mémoire. La commande \cmd{seq} force l'évaluation et permet d'éviter un débordement de mémoire.

\box{info}\boxtitle{L'évaluation paresseuse obéit à des règles strictes.}
Il est possible de déterminer avec précision *si* une expression va être évaluée, et si oui *quand*. C'est parce qu'il est garanti qu'une expression dont le résultat n'est pas utilisé ne sera pas évaluée qu'on peut, par exemple, programmer des opérateurs logiques court-circuitants directement en Haskell, ou manipuler des suites infinies.
\endbox
