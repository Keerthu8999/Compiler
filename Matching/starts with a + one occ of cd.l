letters [a-be-z]
%{
%}
%%
^(a)({letters})*(cd)?({letters})*[\n] {ECHO;printf("valids");break;}
.|\n {ECHO;printf("");break;}
%%
int main()
{
yylex();
}
