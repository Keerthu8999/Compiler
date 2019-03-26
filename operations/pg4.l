%{
#include <stdio.h>
%}
alphanumeric [a-zA-Z0-9]*
digit [0-9]
digits {digit}+
of (\.{digits})?
oe ((E(\+|-)?){digits})?
%{

%}
%%
^({digits}{of}{oe})\n {printf("Matched %s ..Next one pls..\n",yytext); }
. {}
%%
int main()
{
yylex();
return 0;
}
