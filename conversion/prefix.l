%{
#include<bits/stdc++.h>
using namespace std;
stack<char>str;
string arraya,dup1;
int prior(char c);
void printarr();
string reverseStr(string);
int i=0;
int a;
%}
alpha [A-Za-z]
digits [0-9]
operators "+"|"-"|"*"|"/"|";"
%%
({alpha}{digits}{operators})* {reverseStr(yytext);printarr();}
{alpha} {arraya[i++] = yytext[0];}
[\+\-\/\*] {
if(str.empty()){str.push(yytext[0]);}
else if(prior(yytext[0])>prior(str.top())){str.push(yytext[0]);}
else if(prior(yytext[0])<=prior(str.top())){
while(!str.empty()&&(prior(yytext[0])<=prior(str.top()))){
arraya[i++] = (str.top());
str.pop();
}
str.push(yytext[0]);
}
}
[(] {str.push(yytext[0]);}
[)] {while(str.top()!='('){arraya[i++] = (str.top()); str.pop();}str.pop();}
[;] {while(!str.empty()){arraya[i++] = (str.top()); str.pop();}printarr();}
. {}
%%
int prior(char c){
if(c=='(')
	return 1;
else if(c=='+' || c=='-')
	return 2;
else
	return 3;
}
void printarr(){
cout<<endl;
for(a=0;a<i;a++)
{cout<<arraya[a];}
}
string reverseStr(string stri) 
{ 
   int len = stri.length();
   int g=0;
   for(int b=len-1;b>=0;b--)
	stri[b] = dup1[g++];
return dup1; 
   
} 
int main(){
//cout<<yytext<<endl;
yylex();
//for(int a=0;a<i;a++){cout<<arraya[i];}
return 0;
}
