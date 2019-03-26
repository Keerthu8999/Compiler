%{
%}
plus "+"
hyphen "-"
%%
{plus}[0-9]{2,3}{hyphen}[7-9]{1}[0-9]{9} {printf("Valid");break;}
.|\n {printf("Invalid");break;}
%%
int main(){yylex();return 0;}

