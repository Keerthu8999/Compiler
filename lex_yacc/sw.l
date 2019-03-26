%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
void yyerror(char*);
%}
%%
"switch" {return SWITCH;}
"case" {return CASE;}
"break" {return BREAK;}
([a-zA-Z])* {return VARIABLE;}
[0-9] {return NUM;}
[+-/*()[]=\n] {return *yytext;}
[ \t\n] ;
. {printf("Error");}
%%
int yywrap(void){return 1;}
