%{
#include<iostream>
#include<cstring>
bool check(string);
%}
%%
[0-9]* {check(yytext);}
%%
bool check(string s)
{
int x = 0;
int i;
for(i = 0;i<4;i++)
{
 x=x*10+(a[i]-'0');
    if(x%400==0)   cout<<"YES"<<endl;
//        printf("\tYES\n");
    else if(x%4==0&&x%100!=0)
  //      printf("\tYES\n");
    else
    //    printf("\tNO\n");
}

