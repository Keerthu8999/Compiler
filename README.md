Compiler lab Blah blahh!

Compilation steps:

Lex : 
lex filename.l
cc lex.yy.c -ll
./a.out

Yacc:
lex filename.l
yacc -d filename.y
cc lex.yy.c y.tab.c -ll
./a.out
