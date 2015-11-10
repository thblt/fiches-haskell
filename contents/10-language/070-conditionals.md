---
title: Structures conditionnelles
---
\label{conditionals}

Haskell connaît deux structures conditionnelles: les tests binaires avec \hs{if}, et les cas de \hs{case}.

# \hs{if ... then ... else}
\label{if-then-else}

Une clause \hs{if} est une expression, pas une structure de contrôle.
La syntaxe est \hs{if a then b else c}, où \hsFn{a} est une expression de type \hsT{Bool}, \hsFn{b} et \hsFn{c} des expressions d'un type quelconque. Si \hsFn{a} est vraie, l'expression vaut \hsFn{b}, sinon \hsFn{c}.

Comme c'est une expression, on peut affecter son résultat directement à une variable:

\haskell
a = if even x then "pair" else "impair"
\eof

#  \hs{case}
\label{case}