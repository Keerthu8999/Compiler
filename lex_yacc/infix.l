%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
[a-z] {yylval = *yytext - 'a';return VAR;}
[0-9]+ {yylval = atoi(yytext);return INT;}
[+-/*()=\n] {return *yytext;}
[ \t] ;
. {yyerror("Invalid Character");}
%%
int yywrap(void){return 1;}
