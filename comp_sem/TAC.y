%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex(void);
char p = 'A'-1;
%}
%token VARIABLE NUMBER
%%
prog : prog stmt '\n'
     |
     ;
stmt : expr {printf("");}
     ;
expr : NUMBER {}
     | VARIABLE {}
     | expr '+' expr {p++;printf("%c = %c+%c",p,$1,$3);$$=p;}
     | expr '-' expr {p++;printf("%c = %c-%c",p,$1,$3);$$=p;}
     | expr '*' expr {p++;printf("%c = %c*%c",p,$1,$3);$$=p;}
     | expr '/' expr {p++;printf("%c = %c/%c",p,$1,$3);$$=p;}
     | '(' expr ')' {$$=$2;}
     ;
%%
void yyerror(char *a)
{printf("EFhfbjfvjdfhg");}
int main()
{
yyparse();
return 0;
}
