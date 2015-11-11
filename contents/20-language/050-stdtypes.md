---
title: Types de données
id: stdtypes
---

#  Types élémentaires

Haskell fournit un grand nombre de types élémentaires, dont les plus importants sont résumés dans ce tableau:

Type | Description | \rot{\hsTC{Bits}} | \rot{\hsTC{Bounded}} | \rot{\hsTC{Floating}} | \rot{\hsTC{Fractional}} | \rot{\hsTC{Integral}} | \rot{\hsTC{Num}} | \rot{\hsTC{Real}}
-----+-------------+-------------------+----------------------+-----------------------+-------------------------+-----------------------+------------------+--------------------
\hsT{Double}                    |      Virgule flottante, double précision                                      |    |    | \Y | \Y | \Y | \Y | \Y |
\hsT{Float}                     |      Virgule flottante, simple précision                                      |    |    | \Y | \Y | \Y | \Y | \Y |
\hsT{Int}                       |      Entier signé à précision fixe, intervalle minimum $$[-2^{29} ; 2^{29}-1]$$ | \Y | \Y |    |    | \Y | \Y |    |
\hsT{Int8}                      |      Entier signé de 8 bits                                                   | \Y | \Y |    |    | \Y | \Y |    |
\hsT{Int16}                     |      Entier signé de 16 bits                                                  | \Y | \Y |    |    | \Y | \Y |    |
\hsT{Int32}                     |      Entier signé de 32 bits                                                  | \Y | \Y |    |    | \Y | \Y |    |
\hsT{Int64}                     |      Entier signé de 64 bits                                                  | \Y | \Y |    |    | \Y | \Y |    |
\hsT{Integer}                   |      Arbitrary precision signed integer                                       | \Y |    |    |    | \Y | \Y |    |
\hsT{Rational} ou~\hsTC{Ratio a}|      Nombre rationnel de précision arbitraire                                 |    |    |    | \Y | \Y | \Y | \Y
\hsT{Word8}                     |      Entier non signé de 8 bits                                               | \Y | \Y |    |    | \Y | \Y |    |
\hsT{Word16}                    |      Entier non signé de 16 bits                                              | \Y | \Y |    |    | \Y | \Y |    |
\hsT{Word32}                    |      Entier non signé de 32 bits                                              | \Y | \Y |    |    | \Y | \Y |    |
\hsT{Word64}                    |      Entier non signé de 64 bits                                              | \Y | \Y |    |    | \Y | \Y |    |

Table: Types numériques essentiels, d'après cite[145, 147]{OSullivan2008}}

# Types composites

Haskell connaît deux types composites: les tableaux et les n-uplets.
Le type tableau se note \hs{[a]}, un n-uplet se note \hs{(a, b)}, \hs{(a, b, c)}, *etc.*.
Un n-uplet a au moins deux éléments, à l'exception de \hs{()}, le n-uplet vide qui indique qu'une fonction ne renvoie pas de valeur.

Les tableaux sont typés: un tableau ne peut contenir des éléments que d'un type unique, pleinement paramétrisé. Par exemple, un tableau de type \hs{[(Integer, Char)]} (tableau de couples \hsT{Integer}, \hsT{Char}) ne peut pas contenir un autre type de n-uplet, par exemple \hs{(Integer, String)}.