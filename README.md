# Fiches Haskell

J'apprends Haskell, et comme je suis consciencieux, je fais des fiches.

Elles n'ont pas la prétention d'être un support d'apprentissage autonome, et présupposent une connaissance, même basique, du langage. Elles ont vocation à présenter, de manière extrêmement synthétique, pour mémoire ou référence, l'essentiel de Haskell, et pas à se substituer à un apprentissage sérieux.

J'ai décidé de préparer ces fiches pour combler un manque dans la documentation sur Haskell. Les livres dont je dispose sur le langage sont soit trop superficiels, soit insuffisamment systématiques. Certains présentent une version superficelle d'Haskell, d'autres, les plus élaborés, souffrent au contraire du syndrome de l'enseignant passionné : ils ne cessent de s'interrompre et de proposer des apartés hors de propos qui mobilisent soudainement des notions qui ne seront explicitées que plusieurs chapitres plus loin.

Ces fiches tentent donc une présentation plus systématique, mais sans prétention pédagogique. L'ordre d'exposition y est aussi linéaire que possible, mais les renvois se font dans les deux sens : une fiche peut faire référence au contenu d'une fiche antérieure comme ultérieure.

Ce travail est à peine entamé. À terme, il devrait offrir un aperçu complet du langage, et de quelques une des extensions de [GHC](https://www.haskell.org/ghc/).

# Plan des fiches

<section id="toc">
(Je n'ai pas encore écrit le script qui remplacera ce texte par le plan extrait du code LaTeX :-) )
</section>

# Compiler les fiches

**Note :** Cette section est utile uniquement pour qui voudrait modifier les fiches. Pour les consulter, le PDF est disponible dans le dépôt.

Les outils nécessaires sont ceux d'une distribution TeX standard:

 - XeLaTeX
 - Biber

Les familles de caractère suivantes sont utilisées:

 - [Open Sans Condensed](https://www.google.com/fonts/specimen/Open+Sans+Condensed)
 - [Inconsolata-g for Powerline](https://github.com/powerline/fonts/tree/master/Inconsolata-g)

Inconsolata-g for Powerline peut être remplacée par [Inconsolata-g](http://leonardo-m.livejournal.com/77079.html) ou [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html). Pour remplacer les polices, il suffit d'éditer `master.tex` et de remplacer le nom de famille dans `\setmainfont`, `\setsansfont` ou `\setmonofont`.

Pour compiler, il suffit d'exécuter `make.sh`, fourni à la racine du dépôt.

Compilation manuelle : il suffit d'exécuter dans l'ordre les commandes de make.sh. La plus importante est la première, qui génère `fiches/_everything.tex`. Le fichier contient simplement une série de commandes `\input`, une par fichier dans `/fiches/`

## Scripts fournis

On trouvera quelques scripts à la racine du dépôt.

 - `new.sh` génère une nouvelle fiche. Il prend trois paramètres : le numéro de la fiche, un identifiant qui servira au nom de fichier et au label, et un titre, crée un nouveau fichier `fiches/$num-$id.tex` contenant:

 ~~~latex
 \section{$title}
 \label{$id}
 ~~~

 et ouvre ce fichier dans l'éditeur standard.

 - `reorder.sh` renumérote les fichiers de 10 en 10, à partir de 10. Il garantit ainsi que le numéro du fichier = le numéro de la fiche * 10.

 - `make.sh` «automatise» la compilation. Il prend en argument les numéros de fichiers à compiler, ou aucun pour compiler l'ensemble. Par exemple `./make.sh 50 100` compilera (dans l'état actuel du dépôt) uniquement *Lambdas* et *Récursivité*. Attention, ces fiches seront alors numérotées 1 et 2. `make.sh` avec arguments est réservé à la résolution de problèmes avec LaTeX. Il peut aussi introduire des erreurs de référence.

 - `clean.sh` supprime les fichiers intermédiaires de LaTeX.

# Licence

[![Creative Commons BY-NC-SA 2.0 FR](https://i.creativecommons.org/l/by-nc-sa/2.0/fr/80x15.png)](http://creativecommons.org/licenses/by-nc-sa/2.0/fr/) Pour l'instant, ce travail est mis à disposition sous la (relativement restrictive) [Licence Creative Commons Attribution - Pas d’Utilisation Commerciale - Partage dans les Mêmes Conditions 2.0 France](https://creativecommons.org/licenses/by-nc-sa/2.0/fr/).
