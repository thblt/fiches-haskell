# Fiches Haskell

J'apprends Haskell, et comme je suis consciencieux, je fais des fiches.

Elles n'ont pas la prétention d'être un support d'apprentissage autonome, et présupposent une connaissance, même basique, du langage. Elles ont vocation à présenter, de manière extrêmement synthétique, pour mémoire ou référence, l'essentiel de Haskell, et pas à se substituer à un apprentissage sérieux.

J'ai décidé de préparer ces fiches pour combler un manque dans la documentation sur Haskell. Les livres dont je dispose sur le langage sont soit trop superficiels, soit insuffisamment systématiques. Certains présentent une version superficelle d'Haskell, d'autres, les plus élaborés, souffrent au contraire du syndrome de l'enseignant passionné : ils ne cessent de s'interrompre et de proposer des apartés hors de propos qui mobilisent soudainement des notions qui ne seront explicitées que plusieurs chapitres plus loin.

Ces fiches tentent donc une présentation plus systématique, mais sans prétention pédagogique. L'ordre d'exposition y est aussi linéaire que possible, mais les renvois se font dans les deux sens : une fiche peut faire référence au contenu d'une fiche antérieure comme ultérieure.

Ce travail est à peine entamé. À terme, il devrait offrir un aperçu complet du langage, et de quelques une des extensions de [GHC](https://www.haskell.org/ghc/).

# Compiler les fiches

Les fichiers finals sont générés avec Hakyll. Les anciennes versions des fiches utilisaient une série de scripts shells pour produire un unique PDF avec LaTeX : ce comportement sera intégré à terme à la version Hakyll.

~~~bash
$ ghc --make site
$ ./site build
~~~

## Scripts fournis

On trouvera quelques scripts à la racine du dépôt.

 - `new.sh` génère une nouvelle fiche. Il prend trois paramètres : le numéro de la fiche, un identifiant qui servira au nom de fichier et au label, et un titre, crée un nouveau fichier `fiches/$num-$id.md` contenant:

 ~~~latex
 ---
 title: (titre)
 id: (étiquette)
 ~~~

 et ouvre ce fichier dans l'éditeur standard.

 - `reorder.sh` renumérote les fichiers de 10 en 10, à partir de 10. Il garantit ainsi que le numéro du fichier = le numéro de la fiche * 10.

# Licence

[![Creative Commons BY-NC-SA 2.0 FR](https://i.creativecommons.org/l/by-nc-sa/2.0/fr/80x15.png)](http://creativecommons.org/licenses/by-nc-sa/2.0/fr/) Pour l'instant, ce travail est mis à disposition sous la (relativement restrictive) [Licence Creative Commons Attribution - Pas d’Utilisation Commerciale - Partage dans les Mêmes Conditions 2.0 France](https://creativecommons.org/licenses/by-nc-sa/2.0/fr/).
