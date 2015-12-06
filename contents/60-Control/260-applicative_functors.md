---
title: Foncteurs applicatifs
id: Applicative
---

Un foncteur applicatif est une structure intermédiaire entre un foncteur et une monade. 

Il s'agit d'une \qsee{classe de type}{typeclasses}, définie comme suit:

\haskell
class Functor f => Applicative f where
    -- | Lift a value.
    pure :: a -> f a

    -- | Sequential application.
    (<*>) :: f (a -> b) -> f a -> f b

    -- | Sequence actions, discarding the value of the first argument.
    (*>) :: f a -> f b -> f b
    a1 *> a2 = (id <$ a1) <*> a2
    -- This is essentially the same as liftA2 (const id), but if the
    -- Functor instance has an optimized (<$), we want to use that instead.

    -- | Sequence actions, discarding the value of the second argument.
    (<*) :: f a -> f b -> f a
    (<*) = liftA2 const
\eof