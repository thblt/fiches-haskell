---
title: Synonymes de types
id: type-synonyms
---

Haskell permet de définir des synonymes pour des types existants. Les synonymes de type permettent d'augmenter la lisibilité du code ou de masquer des détails d'implémentation.

Contrairement aux types définis avec \qsee{\hsKw{data}}{kw:data}, les informations des synonymes ne sont pas conservées à la compilation.

# \hsKw{type}

\hs{type} crée un synonyme d'un type existant. Le synonyme et le type auquel ils renvoient sont interchangeables.

\haskell
type ObjectId = Int16
\eof

Les synonymes créés avec \hs{type} peuvent servir:

 - À clarifier le sens des champs dans les types personnalisés sans accesseurs (\hs{type ISBN = Int} pour un type \hsT{Book}, par exemple):

	\haskell
	type Authors = [String]
	type Title = String
	type ISBN = Int
	type Year = Int
	data Book2 = Authors Title Year ISBN
	\eof

 - Comme notation abrégée pour des types complexes fréquemment utilisés.

	\haskell
	type Weird = (Int -> String) -> (Int -> Int) -> [Int] -> [(Int, String, Int)]
	\eof
  
# \hsKw{newtype}

Le mot-clé \hsKw{newtype} permet de dupliquer un type, et crée un type distinct de l'original. Les synonymes créés avec \hsKw{newtype} ne sont pas substituables avec le type dont ils sont synonymes. De plus, il n'appartiennent pas automatiquement aux \qsee{types de classe}{typeclasses} de ce dernier.

Leur syntaxe est très proche de celle de \hsKw{data}:

\haskell
newtype MyType = MyType Int
\eof

## Contrairement à \hsKw{data,}

\hsKw{newtype}:

 - n'autorise qu'un seul constructeur et un seul champ.

 - ne conserve pas les informations du type après la compilation. Dans le programme compilé, \hsT{MyType} ci-dessus est traité comme un simple \hsT{Int}:

## Contrairement à \hsKw{type,}

\hsKw{newtype} ne maintient pas la substituabilité du nouveau type et du type dont il est un synonyme. \hsKw{type} sert à faciliter la lecture, \hsKw{newtype} est plutôt utilisé pour masquer l'implémentation.

## \hsKw{newtype} est principalement utile pour:

 - Masquer un type sous-jacent sans la perte de performances liée à l'usage de \hs{data}:

	\haskell
	type ResourceHandle = ResourceHandle Int16
	\eof

 - Permet, sans perte de performances, de fournir des instances différentes d'un unique \qsee{classe de type}{typeclasses} pour un type.

	\haskell
	-- Data.Monoid

	-- Booléen selon la conjonction
	newtype All = All { getAll :: Bool }
	        deriving (Eq, Ord, Read, Show, Bounded)
	
	instance Monoid All where
	        mempty = All True
	        All x `mappend` All y = All (x && y)
	
	-- Booléen selon la disjonction
	newtype Any = Any { getAny :: Bool }
	        deriving (Eq, Ord, Read, Show, Bounded)
	
	instance Monoid Any where
	        mempty = Any False
	        Any x `mappend` Any y = Any (x || y)
	\eof
