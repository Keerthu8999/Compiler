%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex(void);
%}
%token VARIABLE SWITCH CASE NUM BREAK;
%%
prog : prog stmt '\n'
     |
     ;
stmt : SWITCH '(' VARIABLE ')' expr {printf("Valid");}
     ;
expr : CASE NUM ':' VARIABLE ';' BREAK
     | expr
     | 
     ;
%%
void yyerror(char *s){
printf("Error:");}
int main(){
yyparse();
}
