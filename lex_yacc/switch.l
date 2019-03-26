%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
alpha [A-Za-z]
digit [0-9]
%%
"switch" return SWITCH;
"case" return CASE;
"default" return DEFAULT;
[+-/*(){}:;=\n] return *yytext;
"<" return LT;
">" return GT;
"<=" return LE;
">=" return GE;
"==" return EQ;
"!=" return NE;
"stmt" return STMT;
"break" return BREAK;
{digit} return NUM;
[ \t]+ ;
{alpha}({alpha}|{digit})* return ID;
. yyerror("IBAJD");
%%
int yywrap(){return 1;}
