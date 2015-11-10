---
title: Fonctions et variables
---
\label{functions-and-variables}

Haskell n'a pas de notion de variable au sens qu'a ce terme en programmation procédurale. Il est possible d'assigner une expression ou une valeur à un nom, avec la syntaxe \hs{nom = expression}, mais \hsFn{nom} est immuable, et est donc plus proche d'une constante (c'est une variable au sens mathématique du terme).

En combinant ceci avec les principes de \gls{referential-transparency}, \qsee{d'évaluation paresseuse}{lazyness} et \qsee{d'application partielle}{partial-application}, on voit facilement qu'il n'existe aucune différence stricte entre une fonction et une variable, donc qu'il n'existe pas de variables. Par exemple:

\haskell
a = 3 * 2
times3 x = 3 * x
b = times3 2
c = 6
\eof

Ici, \hsFn{times3} est une fonction, \hsFn{a}, \hsFn{b} et \hsFn{c} des variables. Dans la mesure où la valeur d'aucune n'est évaluée tant qu'elle n'est pas utilisée, la variable \hsFn{a} a strictement la même valeur que \hsFn{b}, qui n'est pas 6, mais le \gls{thunk} \hs{3 * 2}.

\box{warn}
Cette identité n'est vraie que des fonctions pures. Les fonctions impures, comme par exemple \hsFn{getLine}, peuvent évidemment renvoyer un résultat différent à chaque invocation. Voir \fsee{io}.
\endbox

La suite de cette fiche ne s'intéresse donc qu'aux fonctions, puisque les «variables» n'en sont qu'un cas particulier.

# Signature de type
\label{type-signatures}

La signature a la forme \hs{f :: TypeA -> TypeRet}, ce qui signifie que la fonction prend un paramètre de type \hsT{TypeA} et renvoie une valeur de type \hsT{TypeRet}.

Une fonction définie avec plusieurs paramètres a pour signature \hs{f :: TypeA -> TypeB -> TypeC -> TypeRet}. Cette syntaxe est explicitée fiche \fsee{partial-application-and-currying}.

Les fonctions d'ordre supérieur utilisent les parenthèses pour indiquer qu'elles prennent une autre fonction en paramètre. Par exemple, le type \hs{map :: (a -> b) -> [a] -> [b]} se lit : \hsFn{map} prend comme premier paramètre une fonction quelconque \hs{x :: a -> b}.

Une variable ou une fonction sans paramètres a pour type \hs{nom :: Type}.

# Fonctions préfixes et infixes
\label{infix-functions}
\label{prefix-functions}

Une fonction est dite \concept{préfixe} si son nom est placé avant ses arguments, et \concept{infixe} si son nom est placé entre ses arguments. \hsFn{map} est une fonction préfixe, \hsFn{+} est infixe. La distinction est syntaxique, et se fait au niveau des caractères qui constituent le nom de la fonction.

\subsubsection[Fonctions infixes]{Une fonction infixe} a un nom composé uniquement de symboles non alphanumériques: \hsFn{+}, \hsFn{*} ou \hsFn{>>=} sont infixes.

On peut utiliser une fonction infixe comme préfixe en entourant son nom de parenthèses : \hs{(+) 1 1}.

\subsubsection[Fonctions préfixes]{Une fonction préfixe} a un nom composé
de caractères alphanumériques. \hsFn{map}, \hsFn{elem} ou \hsFn{foldr} sont préfixes.

On peut utiliser une fonction préfixe comme infixe en entourant son nom de \enconcept{backticks}: \hs{1 `elem` [1..10]}.