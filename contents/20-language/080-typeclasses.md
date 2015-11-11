---
title:  Classes de type
id: typeclasses
---

Les classes de type ne sont pas des classes au sens que ce terme possède en POO.
Elles sont plus proches de ce qu'on nomme des interfaces : elles décrivent des fonctions pour lesquelles un type qui appartient à la classe fournit une implémentation.


# Dérivation automatique

Les types crées avec \hsKw{data} et \hsKw{newtype} peuvent dériver automatiquement certains \qsee{classes de type}{typeclasses}.

## Avec \hsKw{data}

# Dérivation manuelle

\box{law}
À certaines classes de type sont associées des lois (lois des \qsee{foncteurs}{Functor}, lois \qsee{monades}{Monad}, *etc.*) que le compilateur ne peut pas nécessairement contrôler. Il est donc possible de construire des instances pathologiques de classes de type sans recevoir d'avertissement du compilateur.
\endbox

\haskell
class EvalToBool a where
    toBool :: a -> Bool

instance EvalToBool Integer where
    toBool x = x /= 0
\eof
