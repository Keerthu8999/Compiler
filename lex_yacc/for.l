%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
alpha [A-Za-z]
digit [0-9]
%%
"stmt" return STMT;
"for" return FOR;
[+-/*();=\n] return *yytext;
{alpha}({alpha}|{digit})* {return ID;}
{digit} {return DIGIT;}
"<="         return LE;
">="         return GE;
"=="         return EQ;
"!="          return NE;
"||"            return OR;
"&&"         return AND;
.         yyerror("IBVA");

%%
int yywrap(){return 1;}
