%{
#include<stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}
%token STMT FOR ID DIGIT LE GE EQ NE OR AND
%%
prog : prog stmt '\n'
     |
     ;
stmt : FOR '(' expr ';' expr ';' expr ')' STMT {printf("ACCEPTED");}
     ;
expr : '(' expr ')'
     | expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr '/' expr
     | expr '=' expr
     | expr LE expr
     | expr GE expr
     | expr '+' '+'
     |  
     | DIGIT
     | ID
     ;
%%
void yyerror(char *s){
fprintf(stderr,"%s\n",s);}
int main(void){yyparse();}
