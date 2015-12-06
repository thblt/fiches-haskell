---
title: Foncteurs
id: Functor
---

Il s'agit d'une \qsee{classe de type}{typeclasses}, définie comme suit:

\haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b
\eof

\box{law}
 1. \hs{fmap id === id}. Mapper `id` sur un foncteur renvoie le même foncteur. Autrement dit, `fmap` ne peut pas introduire d'autres modifications dans le foncteur que l'application de la fonction. 

 2. \hs{fmap (f . g)  ==  fmap f . fmap g}
\endbox

La métaphore la plus répandue pour décrire un foncteur consiste à le comparer à une boîte qui contient une valeur. La métaphore est un peu courte. Plus abstraitement, un foncteur est un type de \qsee{sorte}{kinds} `* -> *` qui permet l'application d'une fonction sur les données du type encapsulée dans le foncteur.

Ainsi `->` (la définition de fonction) est un foncteur. Par exemple:

~~~ haskell
a = (*) 2        -- Application partielle
b = fmap (*2) a  -- fmap
b 2              -- == 8
~~~

\box{info}
\hsFn{fmap} est une généralisation de \hsFn{map}, et peut donc toujours le remplacer.
\endbox
