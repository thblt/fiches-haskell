---
title: Synonymes de types
id: type-synonyms
---

Haskell permet de définir des synonymes pour des types existants. Les synonymes de type permettent d'augmenter la lisibilité du code ou de masquer des détails d'implémentation.

Contrairement aux types définis avec \qsee{\hsKw{data}}{kw:data}, les informations des synonymes ne sont pas conservées à la compilation.

# Synonymes simples avec \hsKw{type}

\hs{type} crée un synonyme d'un type existant. Le synonyme et le type auquel ils renvoient sont interchangeables.

\haskell
type ObjectId = Int16
\eof

Les synonymes créés avec \hs{type} peuvent servir:

 - À clarifier le sens des champs dans les types personnalisés sans accesseurs (\hs{type ISBN = Int} pour un type \hsT{Book}, par exemple).
 - Comme notation abrégée pour des types complexes fréquemment utilisés.


\haskell
type Authors = [String]
type Title = String
type ISBN = Int
type Year = Int
data Book2 = Authors Title Year ISBN
\eof

# Duplication avec \hsKw{newtype}

Le mot-clé \hsKw{newtype} permet de dupliquer un type, et crée un type absolument distinct de l'original. Les synonymes créés avec \hsKw{newtype} ne sont pas substituables avec le type dont ils sont synonymes. De plus, il n'appartiennent pas automatiquement aux \qsee{types de classe}{typeclasses} de ce dernier.

Leur syntaxe est très proche de celle de \hsKw{data}:

\haskell
newtype MyType = MyType Int
\eof

## Contrairement à \hsKw{type,}

\hsKw{newtype} ne maintient pas la substituabilité du nouveau type et du type dont il est un synonyme. \hsKw{type} sert à faciliter la lecture, \hsKw{newtype} est plutôt utilisé pour masquer l'implémentation.

## Contrairement à \hsKw{data,}

\hsKw{newtype}:

 - n'autorise qu'un seul constructeur,
 - ne conserve pas les informations du type après la compilation. Dans le programme compilé, \hsT{MyType} ci-dessus est traité comme un simple \hsT{Int}:



## Usages de \hsKw{newtype}.

Par exemple: une librairie multiplateforme fournit un accès à une ressource quelconque. Sous un des systèmes cibles, cette ressource est identifiée par un \hsT{Int64}, sous un autre, par un \hsT{String}. En utilisant \hs{newtype}, on peut masquer le type sous-jacent. On pourrait parvenir au même résultat avec un type algébrique dont on exporterait pas le constructeur\todo{\\qsee}, mais serait plus coûteux en terme de performance et d'usage mémoire.

\todo{$\neq$ data/newtype - question de la performance RWH 157 + conséquences sur les motifs RWH 158}
