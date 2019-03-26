%{
int i;
#include<stdio.h>
%}
alpha [A-Za-z] 
digit [0-9]
space [ \t]+
%%
{alpha}({alpha}|{digit}|{space})* {for(i=yyleng-1;i>=0;i--){printf("%c",yytext[i]);}}
.|\n {}
%%
int main()
{
yylex();
return 0;
}
