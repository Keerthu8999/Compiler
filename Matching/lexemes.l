letters [A-Za-z]
digits [0-9]
add [+]
sub [-]
mul [*]
div [\]
mod [%]
%%
if|else|for|while|do|main|char|int|float|double|continue|break {ECHO;printf("is a lexeme, Token - keyword\n");}
[+-/=*%] {ECHO; printf("is a lexeme, Token-Operator\n");}
[\n] {ECHO;printf("new line not a lexeme\n");}
[ \n\t] {ECHO;printf("space not a lexeme\n");}
^[\*]+({letters})*+({digits})* {ECHO;printf("comments not lexeme");}
%%
int main()
{
yylex();
}
