---
title: Foncteurs applicatifs
id: Applicative
---

Il s'agit d'une \qsee{classe de type}{typeclasses}, définie comme suit:

\haskell
class Functor f => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b
    (*>) :: f a -> f b -> f b
    a1 *> a2 = (id <$ a1) <*> a2
    (<*) :: f a -> f b -> f a
    (<*) = liftA2 const
\eof
