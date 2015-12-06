---
title: Application partielle et currying 
id: partialApplicationAndCurrying
---

Une fonction, quel que soit le nombre de paramètres avec lequel elle a été déclarée,
ne prend qu'un seul paramètre et renvoie une autre fonction. Le type de \hs{+},
par exemple, est : \hs{Num a => Num a -> Num a -> Num a}, ce qui signifie que \hs{+}
prend un premier paramètre d'un type de type \hsTC{Num}
