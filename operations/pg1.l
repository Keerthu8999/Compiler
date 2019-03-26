%{
#include <stdio.h>
%}
%%
^(abc)+\n  {printf("\n Question 1 : %s \n", yytext); }
.|\n {}
%%
int main(void)
{
yylex();
return 0;
}
