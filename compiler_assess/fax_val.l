%{
%}
plus "+"
hyphen "-"
%%
{plus}[0-9]{1,3}{hyphen}[0-9]{2,4}{hyphen}[0-9]{7,} {printf("valid");}
%%
int main(){yylex();return 0;}
