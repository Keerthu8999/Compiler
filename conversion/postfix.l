%{
#include<bits/stdc++.h>
using namespace std;
stack<char>str;
string arraya;
int prior(char c);
void printarr();
int i=0;
int a;
%}
alpha [A-Za-z]
digits [0-9]
%%

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
int main(){
//cout<<yytext<<endl;
yylex();
//for(int a=0;a<i;a++){cout<<arraya[i];}
return 0;
}
