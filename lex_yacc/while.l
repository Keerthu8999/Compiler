%{
#include<stdlib.h>
void yyerror(char*);
#include "y.tab.h"
%}
%%
[a-z] {yylval = *yytext - 'a'; return VARIABLE;}
[0-9]+ {yylval = atoi(yytext); return INTEGER;}
[+-/*()\n] return *yytext;
"&&" return AND;
"!" return NOT;
"||" return OR;
[ \t] ;
. yyerror("invalid");
%%
int yywrap(void){return 1;}
