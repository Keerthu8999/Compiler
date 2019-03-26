%{
#include<stdio.h>
%}
alpha [A-Za-z]
digit [0-9]
opencom "/*"
closecom "*/"
opencomm "//"
%%
{alpha}({alpha}|{digit})* {ECHO;}
{opencom}{alpha}({alpha}|{digit})*{closecom} {}
{opencomm}{alpha}({alpha}|{digit})* {}
%%
int main()
{
yylex();
}
