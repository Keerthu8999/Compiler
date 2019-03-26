%{
%}
open ["]
alpha [A-Za-z]
number [0-9]
%%
{open}{alpha}({alpha}|{number})*{open} {if(yyleng<=5) {ECHO;}}
{alpha}({alpha}|{number})* {}
%%
int main()
{yylex();}
