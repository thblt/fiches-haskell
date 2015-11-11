---
title: Opérations sur des listes
id: lists
---

Cette fiche résume quelques unes des fonctions essentielles applicables à des listes.

# Fonctions du premier ordre

## \hs{(++) :: [a] -> [a] -> [a]}

est l'opérateur de concaténation: \hs{"Hask" ++ "ell" == "Haskell"}.

## \hs{take :: Int -> [a] -> [a]}

renvoie les $n$ premiers éléments de la liste, ou la liste si sa taille est inférieure à $n$:
\hs{take 3 [1..10] == [1,2,3]}
;
\hs{take 100 [1,2] == [1,2]}

## \hs{drop :: Int -> [a] -> [a]}

renvoie la liste moins les $n$ premiers éléments, ou la liste vide si sa taille est inférieure à $n$:
\hs{drop 3 [1..6] == [4,5,6]}
;
\hs{drop 100 [1,2] == []}

# Fonctions d'ordre supérieur

## \hs{takeWhile :: (a -> Bool) -> [a] -> [a]}
est similaire à \hsFn{take}, mais renvoie la tête de la liste jusqu'à la dernière valeur pour laquelle la condition est vraie:
\hs{takeWhile (<5) [1..8] == [1,2,3,4]}

## \hs{dropWhile :: (a -> Bool) -> [a] -> [a]}
est similaire à \hsFn{take}, mais renvoie la queue de la liste à partir de la première valeur pour laquelle la condition est fausse:
\hs{dropWhile (<5) [1..8] == [5,6,7,8]}

## \hs{map :: (a -> b) -> [a] -> [b]}

applique une fonction à chaque élément d'une liste: \hs{map (*2) [1,2,3] == [2,4,6]}.

\box{warn}
\hsFn{map} existe pour des raisons historiques. Préférez-lui \qsee{\hsFn{fmap}}{fn:fmap}, qui s'applique à n'importe quel \qsee{foncteur}{Functor} et pas uniquement aux listes.
\endbox


## \hs{head :: [a] -> a}

renvoie le premier élément de la liste, ou génère une exception si la liste est vide.

## \hs{last :: [a] -> a}

renvoie le dernier élément de la liste, ou génère une exception si la liste est vide.

## \hs{tail :: [a] -> [a]}

Lorem ipsum

## \hs{zip :: [a] -> [b] -> [(a, b)]}

Lorem ipsum

## \hs{zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]}

Lorem ipsum

## \hs{zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]}

Lorem ipsum

## \hs{zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]}

Lorem ipsum

