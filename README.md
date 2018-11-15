<!-- README.md is generated from README.Rmd. Please edit that file -->
Science des données IV : pratique
=================================

Engels Guyliann & Philippe Grosjean
-----------------------------------

Ce travail a pour objectif de proposer des solutions simples et efficaces aux étudiants afin de réaliser une recherche de qualité et **reproductible**.

Attendu
=======

Il vous est demandé d'employer ce projet afin de proposer une analyse des données en lien avec votre mémoire.

-   Vos données brutes se trouvent dans : `data -> raw`
-   Le traitemenet de ces données brutes afin d'en faire des données nettoyées et exploitables se fait dans un script R dans : `R`
-   Lorsque vos données sont corrigés, nettoyées et labélisées, sauvegardez les dans `data` avec la fonction

``` r
# exemple de sauvegarde des données 
write(pc, file = "data/physico.rds", type = "rds", compress = "xz")
```

-   Les premières analyses de vos données se font dans un notebook : `analysis -> notebook`.
