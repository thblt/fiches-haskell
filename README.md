# Fiches Haskell

J'apprends Haskell, et comme je suis consciencieux, je fais des fiches.

Elles n'ont pas la prétention d'être un support d'apprentissage autonome, et présupposent une connaissance, même élémentaire, du langage. Elles ont vocation à présenter, de manière extrêmement synthétique, pour mémoire ou référence, l'essentiel de Haskell, et pas à se substituer à un apprentissage sérieux.

J'ai décidé de préparer ces fiches pour combler un manque dans la documentation sur Haskell. Les livres dont je dispose sur le langage sont soit trop superficiels, soit insuffisamment systématiques. Certains présentent une version superficelle d'Haskell, d'autres, les plus élaborés, souffrent au contraire du syndrome de l'enseignant-passionné-mais-pas-méthodique : ils ne cessent de s'interrompre et de proposer des apartés hors de propos qui mobilisent soudainement des notions qui ne seront explicitées que plusieurs chapitres plus loin.

Ces fiches tentent donc une présentation plus rigoureusement systématique, mais sans prétention pédagogique. L'ordre d'exposition y est aussi linéaire que possible, mais les renvois se font dans les deux sens : une fiche peut faire référence au contenu d'une fiche antérieure comme ultérieure.

Ce travail est à peine entamé. À terme, il devrait offrir un aperçu complet du langage, et de quelques une des extensions de [GHC](https://www.haskell.org/ghc/).

# Compiler les fiches

Les fichiers finaux sont générés avec Hakyll. Les anciennes versions des fiches utilisaient une série de scripts shells pour produire un unique PDF avec LaTeX : ce comportement sera intégré à terme à la version Hakyll pour produire simultanément [la version web](http://haskell.thb.lt) et une version imprimable, qui pour l'instant n'est plus disponible.

~~~bash
$ ghc --make site
$ ./site build
~~~

## Scripts fournis

On trouvera quelques scripts à la racine du dépôt.

 - `new.sh` génère une nouvelle fiche. Il prend quatre paramètres : le numéro du «chapitre» dans lequel insérer, le numéro de la fiche, un identifiant qui servira au nom de fichier et au label, et un titre, crée un nouveau fichier `fiches/$chapter-xxx/$num-$id.md` contenant:

 ~~~
 ---
 title: (titre)
 id: (étiquette)
 ---
 ~~~

 puis ouvre ce fichier dans l'éditeur standard.

 - `reorder.sh` renumérote les fichiers de 10 en 10, à partir de 10. Il garantit ainsi que le numéro du fichier = le numéro de la fiche * 10.

## Recompilation sur le serveur

Sur le serveur, la recompilation automatique après un `git push` est automatisée avec un petit script sur le hook `post-receive`. Le monde de Cabal étant un monde assez tortueux, ce script est donc loin d'être assez mûr pour un usage sérieux. Je ne le mets pas sur le dépôt pour l'instant, mais en gros il fonctionne comme ça:

- Les push se font sur un dépôt nu (ie, sans copie de travail). La copie de travail est dans `/var/www`.
- `post-receive` fait un `pull` dans le dépôt de travail, et tente de lancer `cabal run clean` puis `cabal run build`. En général, il y arrive, mais il ne faut pas trop compter dessus non plus.

Le principal problème est que dans la mesure où l'utilisateur actif est `www-data` (le serveur git est sur https), il n'a pas de `$HOME`, ce qui ne plait pas du tout du tout à cabal. Pour l'instant, je feinte sauvagement en faisant un `export HOME` au tout début du script, ce qui n'est pas démesurément propre. Évidemment, il serait aussi possible de tout installer globalement (l'environnement de compilation est dans une *sandbox* cabal) mais c'est encore pire, d'autant plus sur un serveur. Ça marche tant que tous les sites Hakyll utilisent la même version de Hakyll, et tous les programmes Haskell les mêmes versions de tous les paquets, ce qui est une façon de dire que ça ne marchera pas longtemps du tout.

# Licence

[![Creative Commons BY-NC-SA 2.0 FR](https://i.creativecommons.org/l/by-nc-sa/2.0/fr/80x15.png)](http://creativecommons.org/licenses/by-nc-sa/2.0/fr/) Pour l'instant, ce travail est mis à disposition sous la (relativement restrictive) [Licence Creative Commons Attribution - Pas d’Utilisation Commerciale - Partage dans les Mêmes Conditions 2.0 France](https://creativecommons.org/licenses/by-nc-sa/2.0/fr/).
