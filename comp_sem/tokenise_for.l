alpha [a-zA-Z]
keyword "int"|"float"|"char"|"double"|"for"
num [0-9]
punct "+"|"-"|"*"|"/"|"("|")"
operators "<"|">"|"++"|"--"
%%
{alpha} {printf("Alphabet : %s\n",yytext);}
{keyword} {printf("Keyword : %s\n",yytext);}
{num} {printf("Number : %s\n",yytext);}
{punct} {printf("Punctuators : %s\n",yytext);}
{operators} {printf("Operators : %s\n",yytext);}
%%
int main()
{
yylex();
}
