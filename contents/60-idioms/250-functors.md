---
title: Foncteurs
id: Functor
---

Il s'agit d'une \qsee{classe de type}{typeclasses}, définie comme suit:

\haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b
\eof

La métaphore la plus répandue pour décrire un foncteur consiste à le comparer à une boîte qui contient une valeur. La métaphore est un peu courte: 


\box{law}
\haskell
fmap id == id
fmap (f . g)  ==  fmap f . fmap g
\eof
\endbox
