# minipro_compil
Mini projet de compilation Licence 3.

Compilation :

yacc -d iimp.y
lex iimp.l
cc y.tab.c lex.yy.c tree.c -o compIMP

Utilisation :

(3+7)*8

Le terminal affichera l'arbre correspondant à l'expression.
