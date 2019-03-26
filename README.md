Compiler lab Blah blahh!

Compilation steps:

Lex : 
1. lex filename.l  
2. cc lex.yy.c -ll
3. ./a.out

Yacc:
1. lex filename.l
2. yacc -d filename.y
3. cc lex.yy.c y.tab.c -ll
4. ./a.out
