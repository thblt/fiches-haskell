---
title:  Modules
id: modules
---

Haskell dispose d'un mécanisme d'importation de modules.

# Écrire un module

Un module a le même nom que le fichier .hs qui le contient, et \qsee{ce nom commence par une majuscule}{identifiers}. La déclaration de module a la syntaxe suivante:

\haskell
-- MyModule.hs
module Mod
    (
      x,
      y,
      z
    ) where
-- code
\eof

Cette déclaration exporte les identifiants x, y et z du code qui la suit. On exporterait la totalité des noms en enlevant la parenthèse, et aucun en la laissant vide.

\box{info}
Ce n'est pas une erreur de syntaxe que de ne pas respecter la règle nom du module = nom du fichier. Mais un tel module ne serait pas importable.
\endbox

\todo{Exporter un type sans constructeurs + lien depuis defining-types. Handle est un bon exemple de pourquoi. Aussi RWH 159}

# Importation de modules
\label{import}

\haskellN
-- Commande                          Importé
import Mod                        -- x, y, z, Mod.x, Mod.y, Mod.z
import Mod ()                     -- Uniquement les instances, voir ci-dessous. 
import Mod (x,y)                  -- x, y, Mod.x, Mod.y
import qualified Mod              -- Mod.x, Mod.y, Mod.z
import qualified Mod (x,y)        -- Mod.x, Mod.y
import Mod hiding (x,y)           -- z, Mod.z
import qualified Mod hiding (x,y) -- Mod.z
import Mod as Foo                 -- x, y, z, Foo.x, Foo.y, Foo.z
import Mod as Foo (x,y)           -- x, y, Foo.x, Foo.y
import qualified Mod as Foo       -- Foo.x, Foo.y, Foo.z
import qualified Mod as Foo (x,y) -- Foo.x, Foo.y
\eof
\caption*{D'après \cite{Hudak2000}}

Même sans importer aucun nom (c'est le cas de \hs{import Mod ()}), tout \hsKw{import} importe les instances de classes de types définies dans le module importé.


est un cas particulier: contrairement aux apparences, il a bien une utilité, qui est d'importer les instances de \fsee{classes de type}{typeclasses} définies dans \hsM{Mod}.
