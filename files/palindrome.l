%{
#include<stdio.h>
#include<string.h>
bool palindrome(char *a);
char *strrev(char *str);
char a[100];
char b[100];
int i,j,flag;
%}
alpha [a-zA-Z]
digits [0-9]

%%
[a-z A-z 0-9]* {for(i=0,j=yyleng-1;i<=j;i++,j--){
if (yytext[i]==yytext[j])
{
flag=1;
}
else
{
flag=0;
break;
}
}
if  (flag==1)
printf("given string is polyndrome");
else
printf("given string is not polyndrome");
}	

%%
int main(){
extern FILE *yyin, *yyout;
//yyin = fopen("input.txt","r");
//yyout = fopen("output.txt","w");
yylex();
}
