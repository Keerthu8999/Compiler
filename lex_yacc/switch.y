%{
#include<stdio.h>
void yyerror(char *);
int yylex(void);
%}
%token BREAK SWITCH CASE ID DEFAULT NUM LT GT LE GE EQ NE STMT
%%
prog : prog stmt '\n' 
     |
     ;
stmt : SWITCH '(' ID ')' ':' case{printf("ACC");} 
     | SWITCH '(' ID ')' '{' CASE ':'  NUM STMT {printf("ACC");}
     ;
case : CASE ':' NUM STMT BREAK case
     |
     ;
%%
void yyerror(char *s){
fprintf(stderr,"%s\n",s);}
int main()
{
yyparse();
}
