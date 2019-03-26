%{
%}
%%
(a|c)*(bb)(a|c)* {ECHO;}
%%
int main()
{
yylex();
}
