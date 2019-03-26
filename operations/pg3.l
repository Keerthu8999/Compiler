%{
#include <stdio.h>
%}
%%

[a-z]+\n  { yyless(); printf("\n String: %s Length:%d \n", yytext,yyleng); }
.|\n { }
%%
int main(void)
{
yylex();
return 0;
}
