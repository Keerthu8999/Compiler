%{

#include <stdio.h>
%}
number [0-9]+
lower [a-z]
lowe [^aeiouA-Z]
%%
([a]{lowe}*[e]{lowe}*[i]{lowe}*[o]{lowe}*[u]{lowe}*) {printf("Found : %s\n",yytext);}
.|\n {}
%%
int main()
{
yylex();
return 0;
}
