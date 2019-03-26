
digit [0-9]
lower [a-z]
upper [A-Z]
other [^a-zA-Z\n\t]
space [\t]
line [\n]

%{
int a=0;
%}

%%
(.)*(abb)(.)* printf("Invalid\n");
.* printf("Valid: %s\n",yytext);

%%

int main()
{
yylex();
return 0;
}
