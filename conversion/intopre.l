%{
#include<bits/stdc++.h>
using namespace std;
bool isOperator(char c)
{return (!isdigit(c)&&!isalpha(c));}
int getPriority(char C)
{
if(C == '+' || C == '-')
return 1;
else if (C == '*' || C == '/')
return 2;
return 0;
}
string infixToPostfix(string infix){
infix = '(' + infix + ')';
int l = infix.size();
string output;
stack<char>st;
for(int i = 0;i<l;i++){
if(isdigit(infix[i])||isalpha(infix[i]))
output += infix[i];
else if(infix[i] == '('){st.push('('); }
else if(infix[i] == ')')
{
while(st.top() != '(')
{
output += st.top();
st.pop();
}
st.pop();
}		
else{ 
if(isOperator(st.top())){
while(getPriority(infix[i])<=getPriority(st.top())){
output += st.top();
st.pop();
}
st.push(infix[i]);
}
}
}
return output;
}
string infixToPrefix(string infix)
{
int l = infix.size();
reverse(infix.begin(),infix.end());
for(int i = 0;i<l;i++)
{
if(infix[i] == '(') { infix[i] = ')';i++; }
else if(infix[i] == ')') { infix[i] = '(';i++; }
}
string prefix = infixToPostfix(infix);
reverse(prefix.begin(),prefix.end());
return prefix;
}
%}
%%
(.)* {cout<<infixToPostfix(yytext);}
%%
int main()
{
yylex();
return 0;
}
