%{
#include<stdio.h>
#include<stdlib.h>
int flag=0;
%}
%%
[a-z0-9]+@+[a-z]+".com" { flag=1; printf("Valid");break; }
%%
int main()
{
yylex();
if(flag==1)
printf("Accepted");
else
printf("Not Accepted");
}
