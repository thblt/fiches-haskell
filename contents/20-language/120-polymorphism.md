---
title:  Polymorphisme
id: polymorphism
---

# Polymorphisme paramétrique

N'importe quelle \qsee{fonction}{functions-and-variables} ou  \qsee{type}{defining-types} peut accepter des paramètres d'un type non défini. Sa signature remplace dans ce cas le nom d'un type par un paramètre de type, \qsee{qui commence par une minuscule}{identifiers}.

## Types polymorphiques

Le type \hsT{Maybe}, qui représente une valeur possible, est un exemple de type polymorphique. Il a deux constructeurs : \hs{Nothing} et \hs{Just a}. \hs{Nothing} ne prend pas de paramètre, et représente l'absence de valeur. \hs{Just a} prend un paramètre du type quelconque \hsTP{a}.

\ghci
\prompt:type Just 3
Just 3 :: Num a => Maybe a
\prompt:type Just "Une chaîne"
Just "Une chaîne" :: Maybe [Char]
\prompt:type Nothing
Nothing :: Maybe a
\eof

## Fonctions polymorphiques

Une fonction peut accepter, ou renvoyer, des types non-définis.

\haskell
third :: [a] -> Maybe a
third (_:_:x:_) = Just x
third _ = Nothing
\eof

\box{info}\boxtitle{«Théorèmes gratuits»}

Comme une fonction polymorphique n'a pas accès au type réel de son paramètre, on peut déduire (au sens strict) ce qu'elle peut faire à sa seule signature.

La fonction \hs{head :: [a] -> a} n'a pas accès au type \hsTP{a}, et par conséquent ne peut ni construire un nouvel \hsTP{a}, ni modifier un des \hsTP{a} du tableau qu'elle reçoit: elle doit en renvoyer un tel quel. On peut donc déduire que \hs{head b `elem` b}.

La fonction \hs{fst :: (a, b) -> a} ne peut *rien* faire d'autre que renvoyer le premier élément de la paire qui lui est passée, et ignorer le second.

\box{ref}
[@Wadler1989, pp. 33-35, 38-39 and *passim*] explicite le soubassement logico-mathématique de ce principe et montre des applications à des cas beaucoup plus complexes que ces quelque exemples.
\endbox

\endbox

# Polymorphisme *ad hoc*
