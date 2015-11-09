---
title: Foncteurs
---
\label{tc:Functor}

Il s'agit d'une \qsee{classe de type}{typeclasses}, définie comme suit:

\haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b
\eof

\box{law}
Pour tout `f`:

\haskell
fmap id == id
fmap (f . g)  ==  fmap f . fmap g
\eof
\endbox
