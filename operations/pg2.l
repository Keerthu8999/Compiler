%{
#include <stdio.h>
%}
%%
^b(df)+\n  {printf("\n Question 2 : %s \n", yytext); }
.|\n { }
%%
int main(void)
{
yylex();
return 0;
}
