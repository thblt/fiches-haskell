---
title: Définition de types
id: definingTypes
---
\label{kw:data}

La définition de nouveaux types se fait avec le mot-clé \hsKw{data}.

Un type peut combiner plusieurs autres types sous une forme proche de celle d'un enregistrement ou d'un \qsee{tuple}{tuple} (comme un `struct` en C) et/ou fournir une alternative entre plusieurs «sous-types» (comme une `union`) qui ont chacun leur propre constructeur.

\box{math}
Les types de Haskell sont algébriques, c'est-à-dire qu'ils sont définis en enveloppant d'autres types dans des constructeurs, sous la forme d'une somme et/ou d'un produit. La somme de plusieurs types est une *alternative* entre ces types, leur produit est leur combinaison dans un enregistrement.
\endbox

# Combinaison de champs

\todo{phrase intro} Pour décrire un livre, on peut imaginer un type qui réunirait une chaîne de caractères (le titre), un tableau de chaînes de caractères (les noms des auteurs) et un nombre entier (l'année de publication). Un tel type se déclare comme suit:

\haskell
data Book = NewBook String [String] Int
\eof

Cette ligne définit un type nommé \hsT{Book} qui fournit un unique constructeur NewBook. NewBook se comporte comme une fonction qui prend trois paramètres et renvoie un \hsT{Book}: \hs{NewBook :: String -> [String] -> Int -> Book}.

Pour construire un nouveau \hsT{Book}, on écrit donc \hs{book = NewBook "Critique of Pure Reason" ["Immanuel Kant"] 1781}.

Dans cette syntaxe, les arguments du constructeur sont positionnels et doivent être fournis dans l'ordre de la déclaration.

\box{info}
Il est légal et très courant, quand un type ne fournit qu'un seul constructeur, de donner à ce constructeur le nom du type. On aurait alors \hs{data Book = Book String [String] Int}. L'exemple précédent les distingue par souci de clarté, mais n'est pas vraiment idiomatique.
\endbox

# Alternative entre constructeurs
\label{algebraic-types}

Un type algébrique présente une alternative en offrant plusieurs constructeurs.

\haskell
data Bool = True | False
data Maybe a = Nothing | Just a
\eof

# Syntaxe d'enregistrement

La syntaxe d'enregistrement permet de nommer les champs.

\haskell
data Book = Book {
    bookTitle :: String      -- bookTitle :: Book -> String
    bookAuthors :: [String], -- bookAuthors :: Book -> [String]
    bookYear :: Int,         -- bookISBN :: Book -> Int
    }
\eof

Un type qui utilise cette syntaxe peut être instantié avec des arguments positionnels ou des arguments nommés. Ces derniers peuvent être fournis dans n'importe quel ordre:

\haskell
crp = Book "Critique de la Raison Pure" ["Immanuel Kant"] 1781
tlp = Book {
             bookYear=1921,
             bookAuthors=["Ludwig Wittgenstein"],
             bookTitle="Tractatus Logico-Philosophicus"
           }
\eof

Il définit automatiquement une fonction accesseur pour chacun de ses champs. Le type \hsT{Book} ci-dessus fournit ainsi trois fonctions \hs{bookYear :: Book -> Int}, \hs{bookAuthors :: Book -> [String]} et \hs{bookTitle :: Book -> String}:

\ghci
\prompt bookYear tlp
1921
\eof

Enfin, il permet de construire une nouvelle valeur à partir des champs d'une valeur existante:

\haskell
rp = tlp {bookTitle = "Recherches philosophiques", bookYear=1953}
\eof

# Les types comme contextes
# Cas particuliers

# Types énumérés

# Types récursifs

Un type peut faire référence à lui-même. On peut construire un type liste identique au type natif de la façon suivante:

\haskell
data List a = Empty | Cons a (List a)
list = (Cons 1 (Cons 2 (Cons 3 Empty)))
\eof

Un arbre binaire:

\haskell
data BTree a = Node a (BTree a) (BTree a) | Empty deriving Show
\eof
