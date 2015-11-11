---
title: Paramètres, motifs et gardes
id: handlingParameters
---

# Passage de paramètres

\todo{}

## Déconstruction de types composites.

«Déconstruire» un argument d'une fonction permet d'obtenir directement les arguments du constructeur. Par exemple, la fonction suivante déconstruit un constructeur de paire (tuple de deux éléments) pour en renvoyer le premier:

\haskell
toggle :: (a, b) -> a
toggle (x, y) = (y, x)
\eof

Un paramètre non utilisé peut être remplacé par un \hs{_}:

\haskell
duplFirst :: (a, b) -> (a, a)
duplFirst (x, _) = (x, x)
\eof

On n'a pas besoin du second membre de la paire: on la décompose donc en évitant de nommer cet élément.

De la même façon, si le paramètre est un \hsT{Maybe}, on peut récupérer directement sa valeur en déconstruisant \hsC{Just}:

\haskell
double :: Maybe Int -> Int
double (Just x) = x * 2
\eof

## Motifs nommés.
\label{as-patterns}

On peut avoir besoin de déconstruire un paramètre selon un motif en conservant le paramètre entier. Les motifs nommés permettent d'éviter des suites déconstruction-reconstruction redondantes.

La fonction \hsFn{suffixes} \parencite[103]{OSullivan2008} renvoie tous les suffixes d'une liste. Elle peut s'écrire:

\haskell
suffixes :: [a] -> [[a]]
suffixes xs@(_:xs') = xs : suffixes xs'
suffixes _ = []
\eof

# Filtrage par motif et gardes

Le filtrage par motifs et l'emploi de gardes permettent de proposer différentes implémentations d'une même fonction selon les paramètres qui y sont passés, de façon similaire à l'emploi de cas en notation mathématique :

$$
 f(x) =
  \begin{cases}
   f(x-1) + x & \text{si } x > 0 \\
   1          & \text{sinon}
  \end{cases}
$$

Le filtrage par motifs permet de choisir une implémentation selon le type et dans une certaine mesure la valeur des paramètres, les gardes selon une expression arbitraire.

\box{info}
Le filtrage par motif et les gardes permettent de définir plusieurs cas qui se recouvrent. Par exemple, une fonction peut fournir une implémentation pour n'importe quelle liste, et une autre pour n'importe quelle liste *non vide*. Haskell utilise toujours la première implémentation qui s'applique aux paramètres, dans l'ordre de déclaration : il faut donc déclarer les moins générales en premier.
\endbox

# Filtrage par motifs
\label{pattern-matching}

Le filtrage par motifs permet de filtrer selon un constructeur ou selon une valeur arbitraire.

## Par constructeur.

Le filtrage par constructeurs permet de sélectionner quel constructeur d'un \qsee{type algébrique}{algebraic-types} correspond à quelle implémentation.

\haskell
maybeIntToStr :: Maybe Int -> String
maybeIntToStr (Just a) = show a
maybeIntToStr Nothing  = "NaN"
\eof

\haskell
mySum :: (Num a) => [a] -> a
mySum (x:xs) = x + mySum xs
mySum []     = 0
\eof

## Par valeur littérale.

Le filtrage par valeur littérale est le plus simple. Il choisit une implémentation si un paramètre a une valeur déterminée.

\haskell
compte :: String -> String -> Int -> String
compte singulier pluriel 0 = "Aucun(e) " ++ singulier
compte singulier pluriel 1 = "Un(e) " ++ singulier
compte singulier pluriel quantite = show quantite ++ " " ++  pluriel
\eof

\box{warn}
Une valeur littérale *doit* être littérale et ne peut pas, pour des raisons syntaxiques, être une variable. Ce code est erroné:

\haskellN
ultimate = "The Ultimate Question"

answer :: String -> Int
answer ultimate = 42
answer _ = 0
\eof

\hsFn{ultimate} ligne 4 n'est *pas* la variable qui a été définie ligne 1, mais une variable locale qui capture n'importe quel paramètre passé à la fonction et qui masque la variable globale \hsFn{ultimate}. Les lignes 4--5 ne fonctionneront pas comme on pourrait s'y attendre: elles sont strictement équivalentes à la ligne unique \hs{answer _ = 42}.

Pour employer des constantes nommées, on peut utiliser un  \qsee{préprocesseur}{preprocessor} ou les remplacer par un \qsee{type algébrique}{algebraic-types}.
\endbox

## Paramètres ignorés.

Certaines implémentations d'une fonction peuvent ne pas faire usage de tous les paramètres. On ignore un paramètre dans la définition avec le symbole \hs{_}:

La fonction \hsFn{compte} ci-dessus pourrait s'écrire:

\haskell
compte :: String -> String -> Int -> String
compte singulier _ 0 = "Aucun(e) " ++ singulier
compte singulier _ 1 = "Un(e) " ++ singulier
compte _ pluriel quantite = show quantite ++ " " ++  pluriel
\eof

\hs{_} n'est pas un nom de variable mais la mention explicite que le paramètre ne sera pas utilisé.

# Gardes
\label{guards}

Un garde est une expression de type \hsT{Bool}. Si l'expression s'évalue à \hs{True}, l'implémentation qui suit est utilisée.

Leur syntaxe est:

\haskell
func args | garde = impl
\eof

Par exemple, une fonction qui détermine si un nombre est pair, qui s'implémenterait naïvement sous la forme \hs{isEven x = if x `mod` 2 == 0 then True else False} peut s'écrire plus lisiblement:

\haskell
isEven x | x `mod` 2 == 0 = True
isEven _ = False
\eof

La partie à gauche du garde peut être omise si elle est identique à celle qui précède (c'est-à-dire si l'éventuel motif est le même):

\haskell
isEven x | x `mod` 2 == 0 = True
         | otherwise = False
\eof

\box{info}
\hsFn{otherwise} est une constante définie dans le Prélude. Sa valeur est simplement \hsC{True}.

\begin{warnblock}
\hsFn{otherwise} est simplement définie comme \hs{otherwise = True}. Son emploi est donc limité aux gardes.
\end{warnblock}
\endbox

# «\enconcept{Pattern guards}»

\preTwentyTen{PatternGuards}

Haskell 2010 étend la syntaxe des gardes \todo{Cette section}

\haskell
gardes :: Int -> String
gardes a | odd a, a `mod` 5 == 0 = "Impair et/ou multiple de 5"
         | even a = "Pair mais pas multiple de 5"
\eof

\todo{}
