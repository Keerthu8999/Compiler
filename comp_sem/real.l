%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
[a-z] {yylval = *yytext;return VARIABLE;}
[0-9] {yylval = *yytext;return NUMBER;}
[+-{}()/*=\n] {return *yytext;}
[ \t]+ ;
. {printf("Error");}
%%
int yywrap(void)
{
return 1;
}

