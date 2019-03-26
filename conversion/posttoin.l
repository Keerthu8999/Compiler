
%{
#include <bits/stdc++.h> 
using namespace std; 

bool isOperand(char x) 
{ 
return (x >= 'a' && x <= 'z') || 
		(x >= 'A' && x <= 'Z'); 
} 

// Get Infix for a given postfix 
// expression 
string getInfix(string exp) 
{ 
	stack<string> s; 

	for (int i=0; exp[i]!='\0'; i++) 
	{
		string op1,op2; 
		// Push operands 
		if (exp[i]== '+' || exp[i]== '-' || exp[i] == '*' || exp[i] == '/') 
		{ 
	//	string op(1, exp[i]); 
		s.push(string(1,exp[i])); 
		} 

		// We assume that input is 
		// a valid postfix and expect 
		// an operator. 
		else 
			op1 = s.top(); 
			s.pop(); 
			op2 = s.top(); 
			s.pop(); 
			s.push("(" + op2 + exp[i] + 
				op1 + ")");  
	} 

	// There must be a single element 
	// in stack now which is the required 
	// infix. 
	return s.top(); 
} 
%}
%%
(.)* {cout<<getInfix(yytext);}
%%
int main() 
{ 
yylex();
//	string exp = "ab*c+"; 
	//cout << getInfix(exp); 
	return 0; 
} 

