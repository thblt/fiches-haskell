---
title:  Classes de type
id: typeclasses
---

Les classes de type ne sont pas des classes au sens que ce terme possède en POO.
Elles sont plus proches de ce qu'on nomme des interfaces : elles décrivent des fonctions pour lesquelles un type qui appartient à la classe fournit une implémentation.


# Dérivation automatique

Les types crées avec \hsKw{data} et \hsKw{newtype} peuvent dériver automatiquement certains \qsee{classes de type}{typeclasses} avec le mot clé \hsKw{deriving}:

\haskell
data Something = Something Integer Integer deriving (Show)
\eof



## Avec \hsKw{data}

# Dérivation manuelle

\box{warn}
À certaines classes de type sont associées des lois (lois des \qsee{foncteurs}{Functor}, des \qsee{monades}{Monad}, *etc.*) que le compilateur ne peut pas nécessairement contrôler. Il est donc possible de construire des instances pathologiques de classes de type sans recevoir d'avertissement du compilateur.

Autrement dit, le système des classes de types est en partie formel, en partie contractuel. Il convient de vérifier les dimensions contractuelles dans la documentation de la classe de type.

\endbox

\haskell
class EvalToBool a where
    toBool :: a -> Bool

instance EvalToBool Integer where
    toBool x = x /= 0
\eof
