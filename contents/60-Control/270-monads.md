---
title: Monades
id: Monad
---

Au plus simple, une monade est une classe de type définie comme suit:

\haskell
class  Monad m  where
    (>>=)            :: m a -> (a -> m b) -> m b
    (>>)             :: m a -> m b -> m b
    return           :: a -> m a
    fail             :: String -> m a

    m >> k           =  m >>= \_ -> k
\eof

\todo {Déf propre, exemples, >>, >>=}
\todo{Return}