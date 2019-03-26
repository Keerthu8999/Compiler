%{
#include<stdio.h> 
char infix[100];
char in[100];
int i,l;
int j = 0;
char str[100];
void prefix(char*);
%}
alpha [A-Za-z]
digit [0-9]
operator "+"|"-"|"*"|"/"|"("|")"
%%
{alpha}({alpha}|{digit}|{operator})* {prefix(yytext);}
%%
void prefix(char* infix){
for(i = strlen(infix)-1;i>=0;i--){str[j++] = infix[i];}
printf("%s",str);
intopre(str);
}
int main()
{
yylex();
}
