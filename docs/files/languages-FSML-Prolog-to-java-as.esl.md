# File _languages/FSML/Prolog/to-java/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/to-java/as.esl)**
```
symbol class : visible # abstract # name # tpara* # extends # member* -> decl ;
symbol enum : visible # name # name+ -> decl ;
symbol public : -> visible ;
symbol protected : -> visible ;
symbol private : -> visible ;
type abstract = boolean ;
type name = string ;
...
```
